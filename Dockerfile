FROM ubuntu:18.04
USER root
ENV DEBIAN_FRONTEND noninteractive

RUN dpkg --add-architecture i386 && \
    apt-get update -yqq && \
    apt-get install -y curl expect git libc6:i386 libgcc1:i386 libncurses5:i386 libstdc++6:i386 zlib1g:i386 \
        openjdk-17-jdk-headless python3 g++ wget unzip vim git-core gnupg flex bison build-essential zip \
        curl zlib1g-dev libc6-dev-i386 libncurses5 x11proto-core-dev libx11-dev lib32z1-dev libgl1-mesa-dev \
        libxml2-utils xsltproc unzip fontconfig && \
    apt-get clean

RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 1

RUN groupadd android && useradd -d /opt/android-sdk-linux -g android android

COPY tools /opt/tools
COPY licenses /opt/licenses

RUN chown -R android /opt/tools
RUN chown -R android /opt/licenses

# Set root password
RUN echo "root:root" | chpasswd

# Switch to non-root user
USER android

ENV ANDROID_HOME=/opt/android-sdk-linux
ENV ANDROID_SDK_ROOT=${ANDROID_HOME}
ENV ANDROID_SDK_HOME=${ANDROID_HOME}
ENV ANDROID_SDK=${ANDROID_HOME}
ENV PATH=${PATH}:${ANDROID_HOME}/cmdline-tools/latest/bin
ENV PATH=${PATH}:${ANDROID_HOME}/cmdline-tools/tools/bin
ENV PATH=${PATH}:${ANDROID_HOME}/tools/bin
ENV PATH=${PATH}:${ANDROID_HOME}/build-tools/34.0.0
ENV PATH=${PATH}:${ANDROID_HOME}/platform-tools
ENV PATH=${PATH}:${ANDROID_HOME}/emulator
ENV PATH=${PATH}:${ANDROID_HOME}/bin

WORKDIR /opt/android-sdk-linux

RUN bash /opt/tools/android-sdk-update.sh
