cmake_minimum_required(VERSION 3.29.2)

if (NOT "${CMAKE_BUILD_TYPE}" STREQUAL "Release")
	set (CMAKE_BUILD_TYPE "Debug")
endif ()

project(bergie LANGUAGES CXX)

file(GLOB_RECURSE CXX_SOURCES "${PROJECT_SOURCE_DIR}/src/*.cpp")
file(GLOB_RECURSE CXX_HEADERS "${PROJECT_SOURCE_DIR}/src/*.hpp")

include_directories("${PROJECT_SOURCE_DIR}/src")

message("${CMAKE_GLFW_PATH}")

add_executable(bergie ${CXX_HEADERS} ${CXX_SOURCES})

find_package(GLEW REQUIRED)
find_package(glfw3 REQUIRED)
find_package(OpenGL REQUIRED)

target_link_libraries(bergie PRIVATE GLEW::glew glfw OpenGL::GL)
