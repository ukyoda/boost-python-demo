#include <boost/python.hpp>
#include "ImgCtrl.hpp"

BOOST_PYTHON_MODULE(img) {
  using namespace boost::python;
  class_<ImgCtrl>("ImgCtrl")
	 .def("load", &ImgCtrl::load)
   .def("show", &ImgCtrl::show)
   .def("empty", &ImgCtrl::empty)
   ;
}
