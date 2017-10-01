#include "ImgCtrl.hpp"
#include <opencv2/highgui.hpp>
#include <exception>
#include <numpy/ndarrayobject.h>

void ImgCtrl::load(const std::string& filename) {
  img = cv::imread(filename);
  if(!img.data) {
    auto err = std::runtime_error("Image Not Found");
    throw err;
  }
}

bool ImgCtrl::empty() const {
  return !img.data;
}

void ImgCtrl::show(const std::string& windowName, int showMillSeconds) const {
  cv::namedWindow(windowName);
  cv::startWindowThread();
  cv::imshow(windowName, img);
  cv::waitKey(showMillSeconds);
  cv::destroyWindow(windowName);
}
