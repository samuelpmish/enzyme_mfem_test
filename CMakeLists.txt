cmake_minimum_required(VERSION 3.16)
project(enzyme_tests LANGUAGES CXX)

set(CMAKE_EXPORT_COMPILE_COMMANDS 1)

set(CMAKE_CXX_STANDARD 17)

if (LLVM_DIR) 
  message(STATUS "LLVM_DIR: ${LLVM_DIR}")
else()
  message(ERROR ": Need to specify path to LLVM")
endif()

set(TPL_PATH ${PROJECT_SOURCE_DIR}/TPL) 

# dependencies
include(FetchContent)
include(ExternalProject)
include(cmake/gtest.cmake)
include(cmake/mfem.cmake)
include(cmake/enzyme.cmake)

enable_testing()

file(GLOB cpp_tests ${PROJECT_SOURCE_DIR}/tests/*.cpp)

foreach(filename ${cpp_tests})		

  get_filename_component(testname ${filename} NAME_WE)

  add_executable(${testname} ${filename})
  target_link_libraries(${testname} PUBLIC GTest::gtest_main mfem Enzyme)

  add_test(${testname} ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${testname})		

endforeach(filename ${cpp_tests})
