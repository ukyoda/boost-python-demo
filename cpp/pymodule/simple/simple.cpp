#include <boost/python.hpp>
#include "simple.hpp"

BOOST_PYTHON_MODULE(simple) {
  using namespace boost::python;
  def("add", &add);
  def("sub", &sub);
}
