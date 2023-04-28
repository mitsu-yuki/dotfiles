FROM ubuntu:jammy

ENV USER=user HOME=/home/user SHELL=/bin/zsh
RUN apt update -y \
  && apt upgrade -y \
  && apt install curl git zsh make sudo vim -y \
  && useradd -m user -s /bin/zsh \
  && gpasswd -a ${USER} sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> \
/etc/sudoers
USER ${USER}
WORKDIR ${HOME}
RUN git clone https://github.com/mitsu-yuki/dotfiles
CMD [ "/bin/zsh" ]
