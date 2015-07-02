FROM debian
MAINTAINER sventopia <sventopia@me.com>
RUN apt-get update && apt-get -y upgrade && apt-get -y dist-upgrade && apt-get -y autoremove
RUN apt-get install -y build-essential cmake
RUN apt-get install -y qt5-default libvtk6-dev
RUN apt-get install -y zlib1g-dev libjpeg-dev libwebp-dev libpng-dev libtiff5-dev libjasper-dev libopenexr-dev libgdal-dev
RUN apt-get install -y libdc1394-22-dev libavcodec-dev libavformat-dev libswscale-dev libtheora-dev libvorbis-dev libxvidcore-dev libx264-dev yasm libopencore-amrnb-dev libopencore-amrwb-dev libv4l-dev libxine2-dev
RUN apt-get install -y libtbb-dev libeigen3-dev
RUN apt-get install -y python-dev python-tk python-numpy python3-dev python3-tk python3-numpy
RUN apt-get install -y ant default-jdk
RUN apt-get install -y wget zip
RUN wget https://github.com/Itseez/opencv/archive/3.0.0.zip
RUN unzip *.zip
RUN cd opencv*
RUN mkdir build; cd build
RUN cmake -DWITH_QT=ON -DWITH_OPENGL=ON -DWITH_VTK=ON -DWITH_TBB=ON -DWITH_GDAL=ON -DWITH_XINE=ON -DBUILD_EXAMPLES=ON ..
RUN make -j4
RUN make install
RUN ldconfig
