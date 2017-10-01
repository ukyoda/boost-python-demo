cmake_minimum_required(VERSION 3.0)

# ソリューションファイルの名前を指定する
project(pycv)

# CMakeパス追加
set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake ${CMAKE_MODULE_PATH})
message(STATUS "CMAKE_MODULE_PATH: ${CMAKE_MODULE_PATH}")

add_subdirectory(pymodule)
