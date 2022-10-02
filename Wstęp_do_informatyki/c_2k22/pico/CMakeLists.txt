cmake_minimum_required(VERSION 3.13)

include(pico_sdk_import.cmake)

project(flashprint C CXX ASM)
set(CMAKE_C STANDARD 11)
set(CMAKE_CXX_STANDARD 17)

pico_sdk_init()

add_executable(printflash
    morse.c
)

pico_enable_stdio_usb(printflash 1)
pico_enable_stdio_uart(printflash 0)
pico_add_extra_outputs(printflash)
target_include_directories(printflash PRIVATE ${CMAKE_CURRENT_LIST_DIR} )
#target_link_libraries(printflash pico_cyw43_arch_lwip_threadsafe_background pico_stdlib)
target_link_libraries(printflash pico_stdlib)
