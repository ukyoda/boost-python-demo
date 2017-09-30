
function(import_cv)
  find_package(OpenCV REQUIRED)
  find_package(Boost COMPONENTS python REQUIRED)
  find_package(PythonLibs 2.7 REQUIRED)
  set(
    COMMON_INC
    ${OpenCV_INCLUDE_DIRS}
    ${PYTHON_INCLUDE_DIRS}
    ${Boost_INCLUDE_DIRS}
    )
  set(
    COMMON_LIB
    ${OpenCV_LIBS}
    ${Boost_LIBRARIES}
  )
endfunction(import_cv)
