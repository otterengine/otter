cmake_minimum_required(VERSION 3.10)
project(otter)

set(CMAKE_C_STANDARD 90)
set(CMAKE_C_EXTENSIONS OFF)

add_library(otter INTERFACE)

add_subdirectory(modules/otter_slice)

target_link_libraries(otter INTERFACE
  otter_slice
)
