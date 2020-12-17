FROM archlinux:latest
MAINTAINER Jayesh Badwaik <badwaik.jayesh@gmail.com>
RUN pacman -Syy
RUN pacman -S --noconfirm git git-lfs openssl ninja make python bash coreutils diffutils patch wget rsync
RUN pacman -S --noconfirm ccache perl binutils

RUN pacman -S --noconfirm libxml2 clang gmp mpfr

RUN wget https://github.com/Kitware/CMake/releases/download/v3.18.0-rc4/cmake-3.18.0-rc4-Linux-x86_64.sh
RUN chmod a+x cmake-3.18.0-rc4-Linux-x86_64.sh
RUN ./cmake-3.18.0-rc4-Linux-x86_64.sh --prefix=/usr --skip-license

RUN mkdir /root/.gnupg
RUN echo use-agent >> ~/.gnupg/gpg.conf
RUN echo pinentry-mode loopback >> ~/.gnupg/gpg.conf
RUN echo pinentry-program /usr/bin/pinentry-curses >> ~/.gnupg/gpg-agent.conf
RUN echo allow-loopback-pinentry >> ~/.gnupg/gpg-agent.conf
RUN chmod -vR 700 /root/.gnupg
RUN chmod -vR 600 /root/.gnupg/gpg-agent.conf
