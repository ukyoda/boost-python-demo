cmake_minimum_required(VERSION 3.0)

project(img)

# C++11を使う
add_definitions("-Wall -std=c++11")
# -fPIC
set(CMAKE_POSITION_INDEPENDENT_CODE ON)

# パッケージ
find_package(OpenCV REQUIRED)
find_package(Boost COMPONENTS python REQUIRED)
find_package(PythonLibs 2.7 REQUIRED )
find_package(PythonInterp REQUIRED)

# NUMPY設定
# if(NOT NUMPY_INCLUDE_DIR)
#   message(STATUS "Exec_Python: ${PYTHON_EXECUTABLE}")
#   execute_process(COMMAND ${PYTHON_EXECUTABLE} -c "import numpy; print numpy.get_include()"
#                   OUTPUT_VARIABLE NID
#                   OUTPUT_STRIP_TRAILING_WHITESPACE)
#   set(NUMPY_INCLUDE_DIR ${NID})
# elseif(NOT NUMPY_INCLUDE_DIR)
#   find_package(Numpy REQUIRED)
# endif(NOT NUMPY_INCLUDE_DIR)
find_package(NumPy REQUIRED)
message(STATUS "NUMPY_INCLUDE_DIR: ${NUMPY_INCLUDE_DIR}")

# ソースコードを記述
# ==============================================================================
add_library(
  ${PROJECT_NAME}
  SHARED
  img.cpp
  ImgCtrl.cpp
)

# インクルードパスを指定
include_directories(
  ${OpenCV_INCLUDE_DIRS}
  ${PYTHON_INCLUDE_DIRS}
  ${Boost_INCLUDE_DIRS}
  ${NUMPY_INCLUDE_DIR}
  )

# リンカ設定
target_link_libraries(
  ${PROJECT_NAME}
  ${OpenCV_LIBS}
  ${Boost_LIBRARIES}
  ${PYTHON_LIBRARIES}
  )

# 共有ライブラリ設定
set_target_properties( ${PROJECT_NAME} PROPERTIES PREFIX "" )
set_target_properties( ${PROJECT_NAME} PROPERTIES SUFFIX ".so" )

# インストール設定
install(TARGETS ${PROJECT_NAME} DESTINATION lib)
