ExternalProject_Add(TPL_mfem                                                     
    URL               https://github.com/mfem/mfem/archive/refs/tags/v4.5.zip    
    SOURCE_DIR        "${TPL_PATH}/mfem"                                         
    UPDATE_COMMAND    ""                                                         
    INSTALL_COMMAND   ""                                                         
    CONFIGURE_COMMAND                                                            
        cd ${TPL_PATH}/mfem &&                                                   
        cmake . -Bbuild                                                          

    BUILD_COMMAND     cd ${TPL_PATH}/mfem/build && make -j8                      
                                                                                 
    BUILD_BYPRODUCTS ${TPL_PATH}/mfem/build/libmfem.a                            
                     ${TPL_PATH}/mfem/build/config/                              
)                                                                                

add_library(mfem INTERFACE)                                                
add_dependencies(mfem TPL_mfem)                                                  
set_target_properties(mfem PROPERTIES IMPORTED_LOCATION "${TPL_PATH}/mfem/build/libmfem.a")
target_include_directories(mfem INTERFACE "${TPL_PATH}/mfem/")                   
target_include_directories(mfem INTERFACE "${TPL_PATH}/mfem/build/config")       
