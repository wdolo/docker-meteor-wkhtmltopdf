FROM meteorhacks/meteord:base
MAINTAINER Will Dolo <dolatow1@gmail.com>

RUN mkdir -p /dependencies

RUN echo "deb http://archive.ubuntu.com/ubuntu/ trusty multiverse" >> /etc/apt/sources.list \
    && echo "deb-src http://archive.ubuntu.com/ubuntu/ trusty multiverse" >> /etc/apt/sources.list \
    && echo "deb http://archive.ubuntu.com/ubuntu/ trusty-updates multiverse" >> /etc/apt/sources.list \
    && echo "deb-src http://archive.ubuntu.com/ubuntu/ trusty-updates multiverse" >> /etc/apt/sources.list \
    && apt-get update \
    && apt-get upgrade -y \
    && apt-get clean \
    && apt-get autoremove -y

RUN echo "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true" | debconf-set-selections \
    && apt-get install -y build-essential xorg libssl-dev libxrender-dev libjpeg8 fontconfig ttf-mscorefonts-installer xfonts-base xfonts-75dpi curl wget \
    && apt-get clean \
    && apt-get autoremove -y

RUN wget http://download.gna.org/wkhtmltopdf/0.12/0.12.2.1/wkhtmltox-0.12.2.1_linux-trusty-amd64.deb \
    && dpkg --install wkhtmltox-0.12.2.1_linux-trusty-amd64.deb \
    && rm wkhtmltox-0.12.2.1_linux-trusty-amd64.deb

ENTRYPOINT ["wkhtmltopdf"]
CMD ["--extended-help "]
