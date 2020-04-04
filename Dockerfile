# Defines the tag for OBS and build script builds:
#!BuildTag: my_container

# FROM opensuse/tumbleweed
FROM suse/sle15:current


# Work around https://github.com/openSUSE/obs-build/issues/487
RUN zypper install -y openSUSE-release-appliance-docker
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
RUN zypper install -y gcc10 git tar xz
# RUN tar -xf clang-10.0.0.src.tar.xz
RUN ls
# RUN cd clang-10.0.0


# This command will get executed on container start by default
CMD /bin/sh -c
