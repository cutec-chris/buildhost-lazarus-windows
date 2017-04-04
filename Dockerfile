from monokrome/wine
RUN apk add --no-cache bash wget && \
    cd /tmp && \
    wget "https://downloads.sourceforge.net/project/lazarus/Lazarus%20Windows%2032%20bits/Lazarus%201.6.4/lazarus-1.6.4-fpc-3.0.2-win32.exe?r=http%3A%2F%2Fwww.lazarus-ide.org%2F&ts=1491276378&use_mirror=netcologne" -O lazarus-inst.exe
RUN wine lazarus-inst.exe --silent