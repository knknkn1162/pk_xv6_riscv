# build

```sh
# TODO: make these repos submodule
git clone https://github.com/knknkn1162/riscv-pk -b xv6
git clone https://github.com/knknkn1162/xv6-riscv -b rpk
docker run -v $(pwd):/home/main -it --rm vc707/test:riscv_toolchain_qemu
# inside docker
make
make run
```
