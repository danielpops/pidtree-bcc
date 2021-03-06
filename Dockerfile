FROM ubuntu:xenial
RUN apt-get update && apt-get -y install python python-pip virtualenv make llvm lsb-release apt-transport-https
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4052245BD4284CDD
RUN echo "deb https://repo.iovisor.org/apt/$(lsb_release -cs) $(lsb_release -cs) main" > /etc/apt/sources.list.d/iovisor.list
RUN apt-get update && apt-get -y install bcc-tools
ADD . /work
WORKDIR /work
RUN make docker-env
ENTRYPOINT ["/work/run.sh"]
CMD -c example_config 