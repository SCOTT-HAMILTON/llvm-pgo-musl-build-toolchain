# Defines the tag for OBS and build script builds:
#!BuildTag: my_container

# FROM opensuse/tumbleweed
FROM alpine:latest


# Work around https://github.com/openSUSE/obs-build/issues/487
RUN apk update


RUN apk add sed
# add edge repo
RUN sed -i -e 's/v[[:digit:]]\..*\//edge\//g' /etc/apk/repositories
RUN apk upgrade --update-cache --available
RUN cat /etc/alpine-release

# alpine is cleaned, newest


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
RUN apk add build-base gcc git tar xz wget file cmake make z3-dev libxml2-dev \
	ocaml ocaml-runtime ocaml-dev

RUN git clone https://github.com/llvm/llvm-project.git

RUN ls
# RUN cd clang-10.0.0
WORKDIR /opt/llvm-project
RUN mkdir build
WORKDIR /opt/llvm-project/build
RUN cmake \
	-DCMAKE_BUILD_TYPE=Release \
	-DLLVM_ENABLE_PROJECTS=clang \
	-DLLVM_INCLUDE_TESTS=OFF \
	-G "Unix Makefiles" \
	../llvm \
	-L

RUN ls /opt/llvm-project/build

# This command will get executed on container start on by default
CMD /bin/sh -c
