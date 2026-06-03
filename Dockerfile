FROM ubuntu:24.04


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
  build-essential 


RUN sh -c "wget -O - https://dl.openfoam.org/gpg.key > /etc/apt/trusted.gpg.d/openfoam.asc"
RUN add-apt-repository http://dl.openfoam.org/ubuntu
RUN apt -y install openfoam13
RUN apt update && apt upgrade -y 
# Default shell
CMD ["/bin/bash"]
