# ------------------
# Target Build
# ------------------
set(TARGET_NAME app.elf)
file(GLOB files ./src/*.[ch])
add_executable(${TARGET_NAME}
 ${files})
include_directories(${BSP_DIR}/psu_cortexr5_0/include/)

# ------------------
# Library
# ------------------
message("BSP_DIR          : " ${BSP_DIR})
find_library(LIBRARY_XIL
 NAMES xil
 HINTS ${BSP_DIR}/psu_cortexr5_0/lib/
)
find_library(LIBRARY_FREERTOS
 NAMES freertos
 HINTS ${BSP_DIR}/psu_cortexr5_0/lib/
)
message("LIBRARY_XIL      : " ${LIBRARY_XIL})
message("LIBRARY_FREERTOS : " ${LIBRARY_FREERTOS})

link_directories(${TARGET_NAME} ${BSP_DIR}/psu_cortexr5_0/lib/)

target_link_libraries(${TARGET_NAME}
 -Wl,--start-group
 ${LIBRARY_XIL}
 ${LIBRARY_FREERTOS}
 gcc
 c
 -Wl,--end-group
)

