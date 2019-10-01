FROM debian:buster-slim

WORKDIR /opt/src
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt-get update && \
    apt-get install --no-install-recommends -y \
            apt-transport-https=1.8.2 \
            build-essential=12.6 \
            ca-certificates=20190110 \
            curl=7.64.0-4 \
            git=1:2.20.1-2 && \
    rm -fr /var/lib/apt/lists/*

ENV NVM_INSTALL_DIR /opt/nvm
ENV NVM_DIR /usr/local/nvm
ARG NODE_VERSION=stable

# Install nvm
RUN git clone https://github.com/creationix/nvm.git $NVM_INSTALL_DIR

# Install default version of Node.js
RUN source $NVM_INSTALL_DIR/nvm.sh && \
    nvm install $NODE_VERSION && \
    nvm alias default $NODE_VERSION && \
    nvm use default

# Add nvm.sh to .bashrc for startup...
RUN echo "export NVM_DIR=${NVM_DIR}" > $HOME/.bashrc && \
    echo "source ${NVM_INSTALL_DIR}/nvm.sh" > $HOME/.bashrc && \
    source $HOME/.bashrc

ENV NODE_PATH $NVM_DIR/$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/$NODE_VERSION/bin:$PATH
