FROM ubuntu:latest

RUN apt-get update -y && \
    apt-get install apt-transport-https ca-certificates wget gnupg -y && \
    wget -q -O - "https://repos.ripple.com/repos/api/gpg/key/public" | apt-key add - && \
    echo "deb https://repos.ripple.com/repos/rippled-deb focal stable" | tee -a /etc/apt/sources.list.d/ripple.list && \
    apt-get update -y && \
    apt-get install rippled -y

ADD ripple.cfg /etc/opt/ripple/rippled.cfg
ADD validators.txt /etc/opt/ripple/validators.txt

RUN ln -s /opt/ripple/etc/update-rippled-cron /etc/cron.d/

EXPOSE 443 5005 6006 51235 80

CMD /opt/ripple/bin/rippled --conf /etc/opt/ripple/rippled.cfg

