cmake_minimum_required(VERSION 3.0)

project(klass)

# C++11を使う
add_definitions("-Wall -std=c++11")
# -fPIC
set(CMAKE_POSITION_INDEPENDENT_CODE ON)

# パッケージ
#find_package(OpenCV REQUIRED)
find_package(Boost COMPONENTS python REQUIRED)
find_package(PythonLibs 2.7 REQUIRED )

# ソースコードを記述
# ==============================================================================
add_library(
  ${PROJECT_NAME}
  SHARED
  myclass.cpp
  klass.cpp
)

# インクルードパスを指定
include_directories(
  #${OpenCV_INCLUDE_DIRS}
  ${PYTHON_INCLUDE_DIRS}
  ${Boost_INCLUDE_DIRS}
  )

# リンカ設定
target_link_libraries(
  ${PROJECT_NAME}
  #${OpenCV_LIBS}
  ${Boost_LIBRARIES}
  ${PYTHON_LIBRARIES}
  )

# 共有ライブラリ設定
set_target_properties( ${PROJECT_NAME} PROPERTIES PREFIX "" )
set_target_properties( ${PROJECT_NAME} PROPERTIES SUFFIX ".so" )

# インストール設定
install(TARGETS ${PROJECT_NAME} DESTINATION lib)

# # リンカ設定(親に引き継ぐ)
# set(MY_LINKER ${MY_LINKER} simple PARENT_SCOPE)
