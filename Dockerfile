FROM meteorhacks/meteord:base
MAINTAINER Will Dolo <dolatow1@gmail.com>

RUN echo 'deb http://ru.archive.ubuntu.com/ubuntu/ trusty multiverse' >> /etc/apt/sources.list && \
    echo 'deb-src http://ru.archive.ubuntu.com/ubuntu/ trusty multiverse' >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y fontconfig ttf-mscorefonts-installer xorg libjpeg8 libssl-dev libxrender-dev libjpeg8-dev curl
RUN apt-get install -y xfonts-75dpi

RUN curl -O http://download.gna.org/wkhtmltopdf/0.12/0.12.2.1/wkhtmltox-0.12.2.1_linux-trusty-amd64.deb > wkhtmltox.deb
RUN dpkg -i wkhtmltox.deb || true
RUN apt-get install -f -y

ENTRYPOINT ["/usr/local/bin/wkhtmltopdf"]
CMD ["-h"]

