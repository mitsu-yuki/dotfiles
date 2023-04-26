FROM ubuntu:jammy

ENV USER=user HOME=/home/user SHELL=/bin/zsh
RUN apt update -y \
  && apt upgrade -y \
  && apt install curl git zsh make -y \
  && useradd -m user -s /bin/zsh \
  && gpasswd -a ${USER} sudo \
  && cd ${HOME}; git clone https://github.com/mitsu-yuki/dotfiles
USER ${USER}
WORKDIR ${HOME}
CMD [ "/bin/zsh" ]
