# 便利な環境変数
# https://gitlab.kitware.com/cmake/community/-/wikis/doc/cmake/Useful-Variables
# ------------------
# cmakeコマンド.
# > cmake -G "Unix Makefiles" -DCMAKE_TOOLCHAIN_FILE=./armr5_toolchain.cmake ..
# ------------------
message("CMAKE_SOURCE_DIR         : " ${CMAKE_SOURCE_DIR})
message("CMAKE_CURRENT_SOURCE_DIR : " ${CMAKE_CURRENT_SOURCE_DIR})
message("CMAKE_SYSTEM_PROCESSOR   : " ${CMAKE_SYSTEM_PROCESSOR})
message("CMAKE_SYSROOT            : " ${CMAKE_SYSROOT})
message("-----end message when entry-----")

set(PROJECT_NAME project_name_app_hello)
cmake_minimum_required(VERSION 3.1)
project(${PROJECT_NAME} C CXX)

message("CMAKE_BINARY_DIR         : " ${CMAKE_BINARY_DIR})
message("CMAKE_CURRENT_SOURCE_DIR : " ${CMAKE_CURRENT_SOURCE_DIR})
message("CMAKE_SYSTEM_PROCESSOR   : " ${CMAKE_SYSTEM_PROCESSOR})
message("CMAKE_SYSTEM_NAME        : " ${CMAKE_SYSTEM_NAME})
message("CMAKE_SYSROOT            : " ${CMAKE_SYSROOT})
message("CMAKE_TOOLCHAIN_FILE     : " ${CMAKE_TOOLCHAIN_FILE})
message("CMAKE_C_COMPILER         : " ${CMAKE_C_COMPILER})
message("CMAKE_LINKER             : " ${CMAKE_LINKER})
message("CMAKE_C_OUTPUT_EXTENSION : " ${CMAKE_C_OUTPUT_EXTENSION})
message("CMAKE_ASM_OUTPUT_EXTENSION : " ${CMAKE_ASM_OUTPUT_EXTENSION})
message("CMAKE_C_LINK_EXECUTABLE  : " ${CMAKE_C_LINK_EXECUTABLE})
message("CMAKE_C_FLAGS            : " ${CMAKE_C_FLAGS})
message("CMAKE_EXE_LINKER_FLAGS   : " ${CMAKE_EXE_LINKER_FLAGS})
message("-----end message after project-----")

# ------------------
# My Env
# ------------------
set(PROJECT_PARENT_DIR ${CMAKE_BINARY_DIR}/../..)
message("PROJECT_PARENT_DIR : " ${PROJECT_PARENT_DIR})

# ------------------
# Sub Directory.
# ------------------


# ------------------
# Main Directory.
# ------------------
add_subdirectory(./main)


