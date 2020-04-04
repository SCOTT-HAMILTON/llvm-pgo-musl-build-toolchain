# Defines the tag for OBS and build script builds:
#!BuildTag: my_container

# FROM opensuse/tumbleweed
FROM alpine:3.7


# Work around https://github.com/openSUSE/obs-build/issues/487
RUN apk update
# RUN zypper install -y openSUSE-release-appliance-docker
RUN ls

#USER wwwrun
#WORKDIR /srv/www

# Define your additional repositories here
#RUN zypper ar http://download.opensuse.org/repositories/openSUSE:Tools/openSUSE_Factory openSUSE:Tools

# RUN zypper ar http://download.opensuse.org/tumbleweed/repo/oss/x86_64/ oss

# Put additional files into container
#ADD . README.MY_APPLIANCE
# COPY clang-10.0.0.src.tar.xz /opt

# Install further packages using zypper
WORKDIR /opt
RUN ls
RUN apk add gcc git tar xz wget

RUN wget https://github.com/llvm/llvm-project/releases/download/llvmorg-10.0.0/clang-10.0.0.src.tar.xz
# RUN tar -xf clang-10.0.0.src.tar.xz
RUN ls
# RUN cd clang-10.0.0
RUN tar -xf clang-10.0.0.src.tar.xz
RUN ls
RUN cd clang-10.0.0.src
RUN ls
# This command will get executed on container start by default
CMD /bin/sh -c
