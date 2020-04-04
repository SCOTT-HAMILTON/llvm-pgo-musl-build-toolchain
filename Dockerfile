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
RUN apk add build-base gcc git tar xz wget file cmake make z3

RUN git clone https://github.com/llvm/llvm-project.git

RUN ls
# RUN cd clang-10.0.0
WORKDIR /opt/llvm-project
RUN mkdir build
WORKDIR /opt/llvm-project/build
RUN cmake \
	-DLLVM_ENABLE_PROJECTS=clang \
	-G "Unix Makefiles" \
	../llvm \
	-L

RUN ls /opt/llvm-project/build

# This command will get executed on container start on by default
CMD /bin/sh -c
