FROM centos:8
MAINTAINER Jayesh Badwaik <badwaik.jayesh@gmail.com>
RUN yum update -y
RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
RUN dnf install -y 'dnf-command(config-manager)'
RUN dnf config-manager --set-enabled powertools

RUN dnf install -y --allowerasing git openssl-devel ninja-build make python38 bash coreutils diffutils patch wget rsync

RUN dnf install -y ccache perl-Data-Dumper binutils-devel

RUN dnf install -y rpm-build rpm-devel rpmlint rpmdevtools

RUN dnf install -y rpm-sign pinentry

RUN alternatives --set python /usr/bin/python3

RUN dnf install -y createrepo

RUN dnf install -y libxml2{,-devel}

RUN dnf install -y llvm-toolset

RUN dnf install -y glibc-static

RUN dnf install -y libstdc++-static

RUN dnf install -y libatomic libatomic-static

RUN wget https://github.com/Kitware/CMake/releases/download/v3.18.0-rc4/cmake-3.18.0-rc4-Linux-x86_64.sh
RUN chmod a+x cmake-3.18.0-rc4-Linux-x86_64.sh
RUN ./cmake-3.18.0-rc4-Linux-x86_64.sh --prefix=/usr --skip-license

RUN dnf install -y git-lfs
RUN dnf install -y rsync
RUN mkdir /root/.gnupg
RUN echo use-agent >> ~/.gnupg/gpg.conf
RUN echo pinentry-mode loopback >> ~/.gnupg/gpg.conf
RUN echo pinentry-program /usr/bin/pinentry-curses >> ~/.gnupg/gpg-agent.conf
RUN echo allow-loopback-pinentry >> ~/.gnupg/gpg-agent.conf
RUN chmod -vR 700 /root/.gnupg
RUN chmod -vR 600 /root/.gnupg/gpg-agent.conf


RUN dnf install -y gmp-devel
RUN dnf install -y mpfr-devel
