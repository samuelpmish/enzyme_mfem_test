ExternalProject_Add(TPL_enzyme                                                     
    GIT_REPOSITORY    "https://github.com/EnzymeAD/Enzyme.git"
    GIT_TAG           main
    SOURCE_DIR        "${TPL_PATH}/Enzyme"                                         
    UPDATE_COMMAND    ""
    INSTALL_COMMAND   ""
    CONFIGURE_COMMAND
        cd ${TPL_PATH}/Enzyme/enzyme &&                                                   
        cmake -Bbuild -DLLVM_DIR=${LLVM_DIR}

    BUILD_COMMAND cd ${TPL_PATH}/Enzyme/enzyme/build && make -j8
)

# define an enzyme target to make it easier to link against
add_library(Enzyme INTERFACE)                                                    
set(MY_ENZYME_LIB "${TPL_PATH}/Enzyme/enzyme/build/Enzyme/ClangEnzyme-14.so")
set(MY_LLDENZYME_LIB "${TPL_PATH}/Enzyme/enzyme/build/Enzyme/LLDEnzyme-14.so")
target_compile_options(Enzyme INTERFACE -flto)                                   
target_link_options(Enzyme INTERFACE "SHELL: -fuse-ld=lld")                      
target_link_options(Enzyme INTERFACE "SHELL: -Wl,--lto-legacy-pass-manager")
target_link_options(Enzyme INTERFACE "SHELL: -Wl,-mllvm=-load=${MY_LLDENZYME_LIB}")
