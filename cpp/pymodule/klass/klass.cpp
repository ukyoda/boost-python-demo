#include <boost/python.hpp>
#include "myclass.hpp"

BOOST_PYTHON_MODULE(klass) {
  using namespace boost::python;
  class_<myclass>("MyClass")
	 .def("getVal",&myclass::getVal)
   ;
}
