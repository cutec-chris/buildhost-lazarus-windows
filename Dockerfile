FROM jedisct1/phusion-baseimage-latest
MAINTAINER archedraft

# Set correct environment variables
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

RUN apt-get update &&  apt-get -y install xvfb \
                       x11vnc \
                       xdotool \
                       wget \
                       supervisor \
                       x11-apps \
                       net-tools && \
                       rm -rf /var/lib/apt/lists/*
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

ENV DISPLAY :0.0

WORKDIR /root/
ADD novnc /root/novnc/

# Expose Port
EXPOSE 8080

# Prefix commands passed into bash so that they run in xvfb
RUN cd /tmp && \
    curl -L "http://sourceforge.net/projects/lazarus/files/Lazarus%20Windows%2032%20bits/Lazarus%201.6.4/lazarus-1.6.4-fpc-3.0.2-win32.exe/download" -o lazarus-inst.exe
#RUN wine64 "/tmp/lazarus-inst.exe" "/silent /nocancel /suppressmsgboxes=no"

CMD ["/usr/bin/supervisord"]
