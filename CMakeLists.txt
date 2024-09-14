cmake_minimum_required(VERSION 3.16)

cmake_policy(VERSION 3.16)

set(MAJOR_VERSION 0)
set(MINOR_VERSION 1)
set(PATCH_VERSION 13)

project(weight
    VERSION ${MAJOR_VERSION}.${MINOR_VERSION}.${PATCH_VERSION}
    DESCRIPTION "This is a programm for calculating weight!!!"
    HOMEPAGE_URL "https://github.com/SerIsNull"
    LANGUAGES CXX
)

# build binary file and install it into the bin
add_subdirectory(src)

# set some variables for CPACK
set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")
include("Packing")
