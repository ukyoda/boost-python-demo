FROM ubuntu:16.04

# 依存パッケージインストール
RUN    apt-get update \
    && apt-get install -y build-essential \
    && apt-get install -y wget curl git gcc make openssl libssl-dev libbz2-dev libreadline-dev libsqlite3-dev \
    && apt-get install -y python2.7-dev libboost-all-dev \
    && apt-get install -y cmake pkg-config \
    && apt-get install -y libjpeg8-dev libtiff5-dev libjasper-dev libpng12-dev \
    && apt-get install -y libavcodec-dev libavformat-dev libswscale-dev libv4l-dev \
    && apt-get install -y libxvidcore-dev libx264-dev \
    && apt-get install -y libatlas-base-dev gfortran \
    && apt-get install -y libgflags-dev libgoogle-glog-dev \
    && apt-get clean

# Python準備
RUN    cd /tmp \
    && wget https://bootstrap.pypa.io/get-pip.py -O get-pip.py \
    && python get-pip.py \
    && rm get-pip.py \
    && pip install --upgrade pip \
    && pip install numpy

RUN    cd /tmp \
    && wget https://github.com/opencv/opencv/archive/3.2.0.tar.gz -O opencv.tar.gz \
    && wget https://github.com/opencv/opencv_contrib/archive/3.2.0.tar.gz -O opencv-contrib.tar.gz \
    && mkdir opencv && tar xvzf opencv.tar.gz -C opencv --strip-components 1 \
    && mkdir opencv-contrib && tar xvzf opencv-contrib.tar.gz -C opencv-contrib --strip-components 1 \
    && cd opencv \
    && mkdir release \
    && cd release \
    && cmake -D CMAKE_BUILD_TYPE=RELEASE \
             -D CMAKE_INSTALL_PREFIX=/usr/local \
             -D BUILD_opencv_java=OFF \
             -D OPENCV_EXTRA_MODULES_PATH=/tmp/opencv-contrib/modules \
             -D WITH_CUDA=OFF \
             -D BUILD_TIFF=ON \
             -D BUILD_opencv_python2=ON \
             -D PYTHON_EXECUTABLE=$(which python) \
             .. \
    && make -j$(nproc) \
    && make install \
    && cd lib \
    && cp cv2.so /usr/lib/python2.7/dist-packages/ \
    && cd /tmp \
    && rm -f opencv.tar.gz \
    && rm -f opencv-contrib.tar.gz
