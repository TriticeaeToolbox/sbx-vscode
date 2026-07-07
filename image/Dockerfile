FROM docker.io/docker/sandbox-templates:claude-code-docker

USER root

RUN curl -Lo vscode.deb 'https://update.code.visualstudio.com/latest/linux-deb-arm64/stable' && \
  apt-get update && apt-get install --yes ./vscode.deb && \
  rm ./vscode.deb

USER agent

RUN code --extensions-dir ~/.vscode-server/extensions/ --install-extension anthropic.claude-code