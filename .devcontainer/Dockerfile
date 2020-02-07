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
    yasm \
    which ca-certificates \
    which git \
    which python \
    which python-openssl \
    which unzip \
    which wget \
    which zip \
    which build-essential \
    which scons \
    which pkg-config \
    which libx11-dev \
    which libxcursor-dev \
    which libxinerama-dev \
    which libgl1-mesa-dev \
    which libglu-dev \
    which libasound2-dev \
    which libpulse-dev \
    which libfreetype6-dev \
    which libudev-dev \
    which libxi-dev \
    which libxrandr-dev \
    which yasm

#VERSION OF GODOT
ENV GODOT_VERSION "3.2"

#INSTALL GODOT HEADLESS
RUN wget https://downloads.tuxfamily.org/godotengine/${GODOT_VERSION}/Godot_v${GODOT_VERSION}-stable_linux_headless.64.zip \
    && wget https://downloads.tuxfamily.org/godotengine/${GODOT_VERSION}/Godot_v${GODOT_VERSION}-stable_export_templates.tpz \
    && mkdir ~/.cache \
    && mkdir ~/project \
    && mkdir -p ~/.config/godot \
    && mkdir -p ~/.local/share/godot/templates/${GODOT_VERSION}.stable \
    && unzip Godot_v${GODOT_VERSION}-stable_linux_headless.64.zip \
    && mv Godot_v${GODOT_VERSION}-stable_linux_headless.64 /usr/local/bin/godot \
    && unzip Godot_v${GODOT_VERSION}-stable_export_templates.tpz \
    && mv templates/* ~/.local/share/godot/templates/${GODOT_VERSION}.stable \
    && rm -f Godot_v${GODOT_VERSION}-stable_export_templates.tpz Godot_v${GODOT_VERSION}-stable_linux_headless.64.zip

#INSTALL BUTLER FROM ITCH.IO
RUN mkdir -p /opt/butler/bin \ 
    cd /opt/butler/bin \
    wget -O butler.zip https://broth.itch.ovh/butler/linux-amd64/LATEST/archive/default \
    unzip butler.zip \
    chmod +x butler \
    export PATH=/opt/butler/bin/:$PATH \
    cd ~
RUN /opt/butler/bin/butler -V
ENV PATH="/opt/butler/bin:${PATH}"
