#SPECIAL THANKS:
# - aBARICHELLO https://github.com/aBARICHELLO/godot-ci/blob/master/Dockerfile
# - Godot https://docs.godotengine.org/en/3.1/development/compiling/compiling_for_x11.html
FROM ubuntu:latest
LABEL Author="gamedevone1@gmail.com"

#DEPENDANCIES NEEDED:
# - GCC or Clang
# - Python 3 or 2.7+
# - SCons build system (3.0 or later for Python 3)
# - pkg-config (used to detect the dependencies below)
# - X11, Xcursor, Xinerama, Xi and XRandR development libraries
# - MesaGL development libraries
# - ALSA development libraries
# - PulseAudio development libraries
# - Optional - libudev (build with udev=yes)
# - Optional - yasm (for WebM SIMD optimizations)

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    git \
    python \
    python-openssl \
    unzip \
    wget \
    zip \
    build-essential \
    scons \
    pkg-config \
    libx11-dev \
    libxcursor-dev \
    libxinerama-dev \
    libgl1-mesa-dev \
    libglu-dev \
    libasound2-dev \
    libpulse-dev \
    libfreetype6-dev \
    libudev-dev \
    libxi-dev \
    libxrandr-dev \
    yasm

#VERSION OF GODOT
ENV GODOT_VERSION "3.1.1"

#INSTALL GODOT HEADLESS
RUN wget https://downloads.tuxfamily.org/godotengine/${GODOT_VERSION}/Godot_v${GODOT_VERSION}-stable_x11.64.zip \
    && wget https://downloads.tuxfamily.org/godotengine/${GODOT_VERSION}/Godot_v${GODOT_VERSION}-stable_export_templates.tpz \
    && mkdir ~/.cache \
    && mkdir ~/project \
    && mkdir -p ~/.config/godot \
    && mkdir -p ~/.local/share/godot/templates/${GODOT_VERSION}.stable \
    && unzip Godot_v${GODOT_VERSION}-stable_x11.64.zip \
    && mv Godot_v${GODOT_VERSION}-stable_x11.64 /usr/local/bin/godot \
    && unzip Godot_v${GODOT_VERSION}-stable_export_templates.tpz \
    && mv templates/* ~/.local/share/godot/templates/${GODOT_VERSION}.stable \
    && rm -f Godot_v${GODOT_VERSION}-stable_export_templates.tpz Godot_v${GODOT_VERSION}-stable_x11.64.zip

#MOVE PROJECT INTO DOCKER IMG
COPY project/* ~/project/

#SET WORKING DIRECTORY
WORKDIR ~/project

#ENSURE NO PREVIOUS EXPORTS
RUN rm -rf ~/project/build \
    && mkdir ~/project/build \
    && cd ~/project

#CREATE EXPORT FOLDERS
RUN mkdir -v -p ~/project/build/linux \
    && mkdir -v -p ~/project/build/windows \
    && mkdir -v -p ~/project/build/mac \
    && mkdir -v -p ~/project/build/web
    
#GRAB NAME OF PROJECT
RUN export EXPORT_NAME=$(cat *.godot | grep "config/name" | awk -F'"' '{print $2}')

#CREATE GODOT EXPORTS
#RUN timeout 30 godot -v --editor || true
RUN godot project.godot -v -q --export "Linux/X11" ~/project/build/linux/$EXPORT_NAME.x86_64
RUN godot project.godot -v -q --export "Windows Desktop" ~/project/build/windows/$EXPORT_NAME.exe
RUN godot project.godot -v -q --export "Mac OSX" ~/project/build/mac/$EXPORT_NAME.zip
RUN godot project.godot -v -q --export "HTML5" ~/project/build/web/index.html

#LIST BUILDS AFTER COMPLETION
RUN echo "~~~~~~~BUILD~~~~~~~" \
    && ls -R ~/project/build/ \
    && echo "~~~~~~~BUILD~~~~~~~"
