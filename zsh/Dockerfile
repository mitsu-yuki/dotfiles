FROM ubuntu:jammy

ENV USER=user HOME=/home/user SHELL=/bin/zsh
RUN apt update -y \
  && apt upgrade -y \
  && apt install curl git zsh make sudo -y \
  && useradd -m user -s /bin/zsh \
  && gpasswd -a ${USER} sudo
USER ${USER}
WORKDIR ${HOME}
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> \
/etc/sudoers
RUN cd ${HOME}; git clone https://github.com/mitsu-yuki/dotfiles
CMD [ "/bin/zsh" ]
