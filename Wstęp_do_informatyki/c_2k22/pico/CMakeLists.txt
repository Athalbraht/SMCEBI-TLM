cmake_minimum_required(VERSION 3.13)

include(pico_sdk_import.cmake)

project(flashprint C CXX ASM)
set(CMAKE_C STANDARD 11)
set(CMAKE_CXX_STANDARD 17)

pico_sdk_init()

add_executable(printflash
    morse.c
)
