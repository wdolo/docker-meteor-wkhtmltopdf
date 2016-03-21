FROM meteorhacks/meteord:base
MAINTAINER Will Dolo <dolatow1@gmail.com>

RUN mkdir -p /dependencies

RUN apt-get update
RUN apt-get install xvfb -y
RUN curl http://download.gna.org/wkhtmltopdf/0.12/0.12.2.1/wkhtmltox-0.12.2.1_linux-trusty-amd64.deb -o /dependencies/wkhtmltox.deb
RUN dpkg -i /dependencies/wkhtmltox.deb || true
RUN apt-get install -f -y
RUN echo 'exec xvfb-run -a -s "-screen 0 640x480x16" wkhtmltopdf "$@"' | sudo tee /usr/local/bin/wkhtmltopdf.sh >/dev/null
RUN chmod a+x /usr/local/bin/wkhtmltopdf.sh
