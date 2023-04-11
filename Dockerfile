FROM lscr.io/linuxserver/code-server:latest
# install nvm
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
# 注意：这里为了使nvm立即生效，和官方的普通安装说明是不一样的
# 这里参考的是https://github.com/nvm-sh/nvm/blob/master/Dockerfile
RUN echo 'export NVM_DIR="$HOME/.nvm"'                                       >> "$HOME/.bashrc"
RUN echo '[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm' >> "$HOME/.bashrc"
RUN echo '[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion" # This loads nvm bash_completion' >> "$HOME/.bashrc"
# 在docker里执行nvm，需要每次执行前都去source一下
# 安装最新的node
RUN bash -c 'source $HOME/.nvm/nvm.sh && \
nvm install node'
# 安装yarn
RUN bash -c 'source $HOME/.nvm/nvm.sh && corepack enable && corepack prepare yarn@stable --activate'



