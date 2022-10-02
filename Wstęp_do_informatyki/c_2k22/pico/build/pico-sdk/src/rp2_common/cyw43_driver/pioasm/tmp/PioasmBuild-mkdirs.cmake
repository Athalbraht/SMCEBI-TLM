# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/home/albert/Downloads/cc/pico-sdk/tools/pioasm"
  "/home/albert/Projects/SMCEBI-TLM/Wstęp_do_informatyki/c_2k22/pico/build/pioasm"
  "/home/albert/Projects/SMCEBI-TLM/Wstęp_do_informatyki/c_2k22/pico/build/pico-sdk/src/rp2_common/cyw43_driver/pioasm"
  "/home/albert/Projects/SMCEBI-TLM/Wstęp_do_informatyki/c_2k22/pico/build/pico-sdk/src/rp2_common/cyw43_driver/pioasm/tmp"
  "/home/albert/Projects/SMCEBI-TLM/Wstęp_do_informatyki/c_2k22/pico/build/pico-sdk/src/rp2_common/cyw43_driver/pioasm/src/PioasmBuild-stamp"
  "/home/albert/Projects/SMCEBI-TLM/Wstęp_do_informatyki/c_2k22/pico/build/pico-sdk/src/rp2_common/cyw43_driver/pioasm/src"
  "/home/albert/Projects/SMCEBI-TLM/Wstęp_do_informatyki/c_2k22/pico/build/pico-sdk/src/rp2_common/cyw43_driver/pioasm/src/PioasmBuild-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/home/albert/Projects/SMCEBI-TLM/Wstęp_do_informatyki/c_2k22/pico/build/pico-sdk/src/rp2_common/cyw43_driver/pioasm/src/PioasmBuild-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/home/albert/Projects/SMCEBI-TLM/Wstęp_do_informatyki/c_2k22/pico/build/pico-sdk/src/rp2_common/cyw43_driver/pioasm/src/PioasmBuild-stamp${cfgdir}") # cfgdir has leading slash
endif()
