FROM ubuntu:19.04

RUN apt-get update &&\
  apt-get install -y git&&\
  apt-get install -y sudo&&\
  apt-get install -y curl&&\
  apt-get install -y unzip

COPY apt.conf /etc/apt/apt.conf
  
RUN git clone https://github.com/libra/libra.git
WORKDIR "/libra"
RUN echo "y" | ./scripts/dev_setup.sh

CMD ["./scripts/cli/start_cli_testnet.sh"]

