# Copyright 2013-2019, Innoaus Inc., All rights reserved.
  
cmake_minimum_required (VERSION 3.11.0)

project ("omega")

set (CMAKE_CXX_STANDARD 17)
set (CMAKE_CXX_STANDARD_REQUIRED ON)
set (CMAKE_CXX_EXTENSIONS OFF)

set (BUILD_ROOT_DIR ${CMAKE_CACHEFILE_DIR})

include ("${CMAKE_SOURCE_DIR}/cmake/Toolchain-omega2-mipsel.cmake")

set (CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set (CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set (CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

message (" System Name : ${CMAKE_SYSTEM_NAME}")
message ("    ${Blue}Copyright 2013-2019, Innoaus Inc., All Rights Reserved.${Reset}")

set (SOURCES
    source/main.cpp
)
set (HEADERS
    source/main.h
)

add_executable (${PROJECT_NAME}
    ${SOURCES}
    ${HEADERS}
)

target_link_libraries (${PROJECT_NAME}
    dl
)

install (TARGETS ${PROJECT_NAME} DESTINATION bin)
