#ifndef KTYM_PYC_IMG_H
#define KTYM_PYC_IMG_H

#include <opencv2/core.hpp>

class ImgCtrl {
public:

  void load(const std::string& filename);


  bool empty() const;
  void show(const std::string& windowName, int showMillSeconds=0) const;

protected:
  cv::Mat img;
};

#endif
