Building the project and its dependencies
=================

1. Clone the repo:

`git clone https://github.com/samuelpmish/enzyme_mfem_test.git`

---------

2. Configure with `cmake`

```sh
cd path/to/enzyme_mfem_test && cmake . -Bbuild -DCMAKE_BUILD_TYPE=Release                                   \
                                               -DLLVM_DIR=/path/to/llvm-project/build/lib/cmake/llvm        \
                                               -DCMAKE_CXX_COMPILER=/path/to/llvm-project/build/bin/clang++
```

Note: LLVM should probably be built from source, to ensure compatibility with Enzyme.

The docker image used to test this uses LLVM 14.0.6 with the following configure arguments

```sh
cmake -G Ninja /path/to/llvm-project/llvm -DLLVM_TARGETS_TO_BUILD="host"           \
                                          -DLLVM_ENABLE_PROJECTS="clang;lld"       \
                                          -DLLVM_ENABLE_PLUGINS=ON                 \
                                          -DCMAKE_BUILD_TYPE=Release               \
                                          -DLLVM_ENABLE_ASSERTIONS=ON              \
                                          -DLLVM_ENABLE_RUNTIMES="libcxx;libcxxabi" 
```

For mac users, it may also be necessary to include the `-DDEFAULT_SYSROOT=`xcrun --show-sdk-path`` as a configure argument as well.

---------

3. build

`cmake --build build --parallel`

---------

4. test

`cmake --test-dir build -V`
