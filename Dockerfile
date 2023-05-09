# # FROM ubuntu:20.04

# # ENV DEBIAN_FRONTEND=noninteractive

# # # Install necessary packages
# # RUN apt-get update && \
# #     apt-get install -y python3 python3-pip python3-dev git wget && \
# #     pip3 install --upgrade pip

# # # Install TensorFlow latest
# # RUN pip3 install tensorflow

# # # Clone the TensorFlow models repository and checkout the 1.13 branch
# # RUN git clone https://github.com/tensorflow/models.git && \
# #     cd models && \
# #     git checkout r1.13.0 && \
# #     cd research

# # # Install object detection API dependencies
# # RUN apt-get install -y protobuf-compiler python-pil python-lxml && \
# #     pip3 install jupyter matplotlib cython && \
# #     cd object_detection && \
# #     protoc object_detection/protos/*.proto --python_out=. && \
# #     export PYTHONPATH=$PYTHONPATH:`pwd`:`pwd`/slim

# # # Copy the object detection example script and test image into the container
# # COPY object_detection_example.py /app/
# # COPY test_images/image1.jpg /app/test_images/

# # WORKDIR /app

# # CMD ["python3", "object_detection_example.py"]

# # FROM ubuntu:bionic
# FROM ubuntu:20.04
# RUN apt-get update && apt-get install  python3-pip curl unzip -yf 
# #python3 tesseract-ocr
# RUN apt-get update -y
# RUN apt-get install -y dbus-x11

# # RUN apt -y install libssl1.1

# USER root
# RUN apt update
# RUN apt-get install -y poppler-utils
# RUN apt-get clean
# RUN apt install -y python3 python3-pip
# RUN DEBIAN_FRONTEND=noninteractive apt install -y python3-xlib python3-tk python3-dev
# RUN apt-get update \
#   && apt-get -y install gcc \
#   && apt-get -y install g++ \
#   && apt-get -y install unixodbc unixodbc-dev \
#   && apt-get clean
# # RUN pip3 install virtualenv
# # RUN mkdir /app
# RUN apt-get install wget
# RUN apt-get update -y &&  apt-get upgrade -y && \
#     apt-get install -y wget build-essential checkinstall  libncursesw5-dev  libssl-dev  libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev && \
#     cd /usr/src && \
#     wget https://www.python.org/ftp/python/3.9.12/Python-3.9.12.tgz && \
#     tar xzf Python-3.9.12.tgz && \
#     cd Python-3.9.12 && \
#     ./configure --enable-optimizations && \
#     make altinstall
# RUN pip3 install --upgrade pip 
# # COPY requirements.txt ./app
# ENV PYTHONUNBUFFERED=1
# RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
#   && curl https://packages.microsoft.com/config/debian/10/prod.list > /etc/apt/sources.list.d/mssql-release.list \
#   && apt-get update \
#   && ACCEPT_EULA=Y  apt-get install -y --no-install-recommends --allow-unauthenticated msodbcsql17 mssql-tools



# #RUN apt-get install libnvinfer7=7.0.0-1+cuda10.2 libnvonnxparsers7=7.0.0-1+cuda10.2 libnvparsers7=7.0.0-1+cuda10.2 libnvinfer-plugin7=7.0.0-1+cuda10.2 libnvinfer-dev=7.0.0-1+cuda10.2 libnvon$
# #RUN apt-mark hold libnvinfer7 libnvonnxparsers7 libnvparsers7 libnvinfer-plugin7 libnvinfer-dev libnvonnxparsers-dev libnvparsers-dev libnvinfer-plugin-dev python3-libnvinfer python3-libnvin$
# #RUN apt-get -y --no-install-recommends  --allow-change-held-packages install libcudnn8
# #RUN apt-get -y install tensorrt



# RUN mkdir -p /app/tensorflow/models
# RUN pip install tensorflow
# RUN apt install -y libprotobuf-dev 

# RUN apt-get install -y protobuf-compiler 
# # RUN apt-get install -y python-pil 
# # RUN apt-get install -y python-lxml
# RUN apt-get -y install git

# # RUN pip install jupyter
# RUN pip install matplotlib
# RUN git clone --branch r2.1.0 https://github.com/tensorflow/models.git /app/tensorflow/models
# WORKDIR /app/tensorflow/models/research
# RUN protoc object_detection/protos/*.proto --python_out=.
# RUN cp object_detection/packages/tf2/setup.py .
# RUN pip install .


# RUN apt-get install -y scrot dos2unix
# RUN pip install python3_xlib 
# RUN pip3 install python-xlib
# RUN pip3 install python-dotenv
# RUN pip3 install opencv-python

# EXPOSE 6006
# WORKDIR /  
# COPY . . 
# WORKDIR /app
# COPY object_detection_example.py /app/
# COPY test_images/image1.jpg /app/test_images/

# WORKDIR /app

# CMD ["python3", "object_detection_example.py"]

 
FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y python3 python3-pip python3-dev git wget build-essential checkinstall libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev \
    protobuf-compiler python3-pil python3-lxml python3-tk python3-xlib python3-dotenv python3-opencv scrot dos2unix curl unzip && \
    pip3 install --upgrade pip && \
    pip3 install tensorflow==2.6.0 jupyter matplotlib cython && \
    pip3 install python-xlib && \
    pip3 install --no-cache-dir tensorflow-object-detection-api==0.1.1 && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean
COPY object_detection_example.py /app/
COPY test_images/image1.jpg /app/test_images/

WORKDIR /app

CMD ["python3", "object_detection_example.py"]
