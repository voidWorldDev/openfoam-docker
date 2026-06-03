FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

# Basic tools
RUN apt-get update && apt-get install -y \
  wget \
  curl \
  gnupg \
  lsb-release \
  software-properties-common \
  sudo \
  nano \
  vim \
  build-essential \
  && rm -rf /var/lib/apt/lists/*

RUN sh -c "wget -O - https://dl.openfoam.org/gpg.key > /etc/apt/trusted.gpg.d/openfoam.asc"
RUN add-apt-repository http://dl.openfoam.org/ubuntu
RUN apt -y install openfoam13
RUN echo "source /opt/openfoam13/etc/bashrc" >> /root/.bashrc

# Default shell
CMD ["/bin/bash"]
