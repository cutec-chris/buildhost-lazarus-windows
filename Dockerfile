FROM alpine 
MAINTAINER Bailey Stoner <monokrome@monokro.me>

RUN apk update
RUN apk add wine xvfb curl

# Prefix commands passed into bash so that they run in xvfb
RUN cd /tmp && \
    curl -L "http://sourceforge.net/projects/lazarus/files/Lazarus%20Windows%2032%20bits/Lazarus%201.6.4/lazarus-1.6.4-fpc-3.0.2-win32.exe/download" -o lazarus-inst.exe
ENV DISPLAY :0
RUN exec wine "/tmp/lazarus-inst.exe" "/silent /nocancel /suppressmsgboxes=no"
#ENTRYPOINT xvfb-run -a wine
