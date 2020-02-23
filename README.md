# pk_xv6_riscv

riscv-pk(M-mode) + xv6_riscv(S-mode, U-mode).

## build

```sh
# TODO: make these repos submodule
git clone --recursive https://github.com/knknkn1162/pk_xv6_riscv
cd pk_xv6_riscv
docker run -v $(pwd):/home/main -it --rm knknkn1162/riscv_toolchain_qemu
# inside docker
# or make DEBUG=ON
make
make run
```
