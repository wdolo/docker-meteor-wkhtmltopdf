FROM meteorhacks/meteord:base
MAINTAINER Will Dolo <dolatow1@gmail.com>

RUN mkdir -p /dependencies

RUN apt-get update
RUN apt-get install xvfb -y
RUN curl http://download.gna.org/wkhtmltopdf/0.12/0.12.2.1/wkhtmltox-0.12.2.1_linux-trusty-amd64.deb -o /dependencies/wkhtmltox.deb
RUN dpkg -i /dependencies/wkhtmltox.deb || true
RUN apt-get install -f -y
