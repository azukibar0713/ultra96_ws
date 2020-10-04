message("-----begin armr5_toolchain.cmake-----")
# ------------------
# ARMコンパイラをWindows環境でテストすると以下のエラーとなってしまう対策.
#  The C compiler
#    "F:/Xilinx/SDK/2019.1/gnu/armr5/nt/gcc-arm-none-eabi/bin/armr5-none-eabi-gcc.exe"
#  is not able to compile a simple test program.
# ------------------
set(CMAKE_TRY_COMPILE_TARGET_TYPE "STATIC_LIBRARY")

# ------------------
# preparation for XSDK path
# ------------------
set(CROSS_PREFIX "armr5-none-eabi-")
#if(WIN32)
#    execute_process(COMMAND where ${CROSS_PREFIX}gcc OUTPUT_VARIABLE GCC_FILE_PATH)
#else()
#    execute_process(COMMAND which ${CROSS_PREFIX}gcc OUTPUT_VARIABLE GCC_FILE_PATH)
#endif()

# ------------------
# target
# ------------------
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)

# ------------------
# toolchain
# ------------------
set(CMAKE_C_COMPILER   ${CROSS_PREFIX}gcc)
#set(CMAKE_CXX_COMPILER ${CROSS_PREFIX}g++)
#set(CMAKE_LINKER       ${CROSS_PREFIX}ld)
set(CMAKE_LINKER       ${CROSS_PREFIX}gcc) # SDKではgccになってる.
set(CMAKE_AR           ${CROSS_PREFIX}ar)
set(CMAKE_RANLIB       ${CROSS_PREFIX}ranlib)
set(CMAKE_AS           ${CROSS_PREFIX}as)
set(CMAKE_NM           ${CROSS_PREFIX}nm)
set(CMAKE_OBJDUMP      ${CROSS_PREFIX}objdump)

# ------------------
# Compiler Option
# ------------------
message("CMAKE_BUILD_TYPE            : " ${CMAKE_BUILD_TYPE})
if ("${CMAKE_BUILD_TYPE}" STREQUAL "Debug")
    add_definitions(-DARMR5 -DMY_DEBUG_INFO)
    set(GCC_COVERAGE_COMPILE_FLAGS "-Wall -O0 -g3 -fmessage-length=0 -mcpu=cortex-r5 -mfloat-abi=hard -mfpu=vfpv3-d16")
elseif("${CMAKE_BUILD_TYPE}" STREQUAL "Release")
    set(GCC_COVERAGE_COMPILE_FLAGS "-Wall -O2 -fmessage-length=0 -mcpu=cortex-r5 -mfloat-abi=hard -mfpu=vfpv3-d16")
else()
    # ToolChainの設定で、CMAKE_BUILD_TYPEが空になってしまうのでDebugの設定としておく.
    add_definitions(-DARMR5 -DMY_DEBUG_INFO)
    set(GCC_COVERAGE_COMPILE_FLAGS "-Wall -O0 -g3 -fmessage-length=0 -mcpu=cortex-r5 -mfloat-abi=hard -mfpu=vfpv3-d16 -MMD -MP")
#    message(FATAL_ERROR "FATAL_ERROR! you must add -DCMAKE_BUILD_TYPE=Debug or -DCMAKE_BUILD_TYPE=Release")
endif()

set(CMAKE_C_FLAGS  "${GCC_COVERAGE_COMPILE_FLAGS}")
#set(CMAKE_C_FLAGS  "${CMAKE_C_FLAGS} ${GCC_COVERAGE_COMPILE_FLAGS}")

# ------------------
# Linker Optoin
# ------------------
set(GCC_COVERAGE_LINK_FLAGS "-mcpu=cortex-r5 -mfloat-abi=hard -mfpu=vfpv3-d16 -T ${APP_DIR}/src/lscript.ld")
set(CMAKE_EXE_LINKER_FLAGS  "${GCC_COVERAGE_LINK_FLAGS}")
#set(CMAKE_EXE_LINKER_FLAGS  "${CMAKE_EXE_LINKER_FLAGS} ${GCC_COVERAGE_LINK_FLAGS}")

message("-----end armr5_toolchain.cmake-----")

# ------------------
# 出力先
# ------------------
#set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ../Debug/)
