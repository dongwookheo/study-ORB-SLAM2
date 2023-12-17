FROM ubuntu:jammy

MAINTAINER dongwookheo
ARG DEBIAN_FRONTEND=noninteractive

RUN apt update -y && apt upgrade -y

# Related to build...
RUN apt install build-essential -y && \
apt install vim -y && \
apt install cmake -y && \
apt install git -y && \
apt install sudo -y && \
apt install wget -y && \
apt install ninja-build -y && \
apt install software-properties-common -y && \
apt install python3 -y && \
apt install python3-pip -y

# Related to JetBrains CLion Docker develpoment...
RUN apt install -y ssh && \
apt install -y gcc && \
apt install -y g++ && \
apt install -y gdb && \
apt install -y clang && \
apt install -y cmake && \
apt install -y rsync && \
apt install -y tar && \
apt install -y mesa-utils

# Related to X11 remote display
RUN apt install -y libgl1-mesa-glx && \
apt install -y libglu1-mesa-dev && \
apt install -y mesa-common-dev && \
apt install -y x11-utils && \
apt install -y x11-apps && \
apt install -y zip && \
apt clean

# ORB-SLAM2 Dependencies
RUN apt update && \
apt install -y build-essential cmake git pkg-config libgtk-3-dev \
 libavcodec-dev libavformat-dev libswscale-dev libv4l-dev \
 libxvidcore-dev libx264-dev libjpeg-dev libpng-dev libtiff-dev \
 gfortran openexr libatlas-base-dev python3-dev python3-numpy \
 libtbb2 libtbb-dev libdc1394-dev

# OpenCV & OpenCV_contrib
RUN apt install -y cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
RUN cd / &&\
    wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/refs/tags/3.4.16.zip && \
    wget -O opencv.zip https://github.com/opencv/opencv/archive/refs/tags/3.4.16.zip && \
    unzip opencv_contrib.zip && \
    unzip opencv.zip && \
    cd opencv-3.4.16 && \
    mkdir build && cd build && \
    cmake -GNinja -DCMAKE_BUILD_TYPE=Release -DOPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-3.4.16/modules .. && ninja && ninja install

# Pangolin
RUN apt install -y libgl1-mesa-dev libwayland-dev libxkbcommon-dev wayland-protocols libegl1-mesa-dev libc++-dev libglew-dev libeigen3-dev
RUN cd / &&\
    wget https://github.com/stevenlovegrove/Pangolin/archive/refs/tags/v0.6.zip &&\
    unzip v0.6.zip &&\
    cd Pangolin-0.6 && mkdir build && cd build &&\
    cmake -GNinja -DCMAKE_BUILD_TYPE=Release .. && ninja && ninja install &&\
    cd ../../

# Eigen3
RUN cd / &&\
    wget -O eigen.zip https://gitlab.com/libeigen/eigen/-/archive/3.3.9/eigen-3.3.9.zip &&\
    unzip eigen.zip &&\
    cd eigen-3.3.9 &&\
    mkdir build && cd build &&\
    cmake -GNinja -DCMAKE_BUILD_TYPE=Release .. && ninja install &&\
    cd ../../

# easy_profiler
RUN cd / &&\
    wget -O easy_profiler.zip https://github.com/yse/easy_profiler/archive/refs/heads/develop.zip &&\
    unzip easy_profiler.zip &&\
    cd easy_profiler-develop &&\
    mkdir build && cd build &&\
    cmake -GNinja -DCMAKE_BUILD_TYPE=Release .. && ninja && ninja install &&\
    cd ../../

# spdlog
RUN cd / &&\
    wget -O spdlog.zip https://github.com/gabime/spdlog/archive/refs/tags/v1.12.0.zip &&\
    unzip spdlog.zip &&\
    cd spdlog-1.12.0 &&\
    mkdir build && cd build &&\
    cmake -GNinja -DCMAKE_BUILD_TYPE=Release .. && ninja && ninja install &&\
    cd ../../


RUN apt autoclean

RUN mkdir slam && cd slam && \
    git clone https://github.com/dongwookheo/study-ORB-SLAM2 &&\
    cd study-ORB-SLAM2 && ./build.sh 