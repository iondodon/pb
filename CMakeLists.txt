cmake_minimum_required(VERSION 3.8)
project(pb)

set(CMAKE_CXX_STANDARD 11)

set(SOURCE_FILES rmq.cpp)
add_executable(pb ${SOURCE_FILES})