#include "myclass.hpp"
#include <iostream>

myclass::myclass() {
  std::cerr << "Call Constructor" << std::endl;
}

myclass::~myclass() {
  std::cerr << "Call Destructor" << std::endl;
}

int myclass::getVal() const {
  return val;
}
