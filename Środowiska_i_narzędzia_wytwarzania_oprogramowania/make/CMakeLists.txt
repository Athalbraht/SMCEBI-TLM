cmake_minimum_required(VERSION 3.10)
project(myproject)
include_directories(
		${PROJECT_SOURCE_DIR}/include
)


set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_FLAGS "-Wall -Wextra -Og -g")


FILE(GLOB SOURCES ${PROJECT_SOURCE_DIR}/src/*.cpp)
#set(SOURCES
#		src/test.cpp
#		src/main.cpp
#		)

add_executable(${CMAKE_PROJECT_NAME}
		${SOURCES}
)
