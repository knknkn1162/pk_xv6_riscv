.PHONY: all run

RISCV_PK_DIR=$(CURDIR)/riscv-pk
RISCV_PK_BUILD_DIR=$(RISCV_PK_DIR)/build

XV6_DIR=$(CURDIR)/xv6-riscv
XV6_KERNEL=$(XV6_DIR)/kernel/kernel
TOOLPREFIX=riscv64-unknown-elf
DEBUG=OFF
PAYLOAD_START=0x80200000

all: clean xv6_build pk_build

pk_build:
	mkdir -p $(RISCV_PK_BUILD_DIR); cd $(RISCV_PK_BUILD_DIR); \
	../configure --enable-boot-machine --with-payload=$(XV6_KERNEL) --with-payload-start=$(PAYLOAD_START) --host=$(TOOLPREFIX)
	make -C $(RISCV_PK_BUILD_DIR)

xv6_build:
	make -C $(XV6_DIR) build DEBUG=$(DEBUG) PAYLOAD_START=$(PAYLOAD_START)

run:
	make -C $(XV6_DIR) run KERNEL_BIN=$(RISCV_PK_BUILD_DIR)/bbl
clean:
	$(RM) -r $(RISCV_PK_BUILD_DIR)
	make -C xv6-riscv clean
