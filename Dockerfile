FROM meteorhacks/meteord:base
MAINTAINER Will Dolo <dolatow1@gmail.com>

RUN apt-get update
RUN apt-get install -y xfonts-75dpi
RUN curl -O http://download.gna.org/wkhtmltopdf/0.12/0.12.2.1/wkhtmltox-0.12.2.1_linux-trusty-amd64.deb > wkhtmltox.deb
RUN dpkg -i wkhtmltox.deb || true
RUN apt-get install -f -y

ENTRYPOINT ["/usr/local/bin/wkhtmltopdf"]
CMD ["-h"]

