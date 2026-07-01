FROM docker.io/docker/sandbox-templates:claude-code-docker

USER root

RUN curl -Lo vscode.deb 'https://go.microsoft.com/fwlink/?LinkID=760868' && \
    apt-get update && apt-get install --yes ./vscode.deb && \
    rm ./vscode.deb

USER agent

RUN code --extensions-dir ~/.vscode-server/extensions/ --install-extension anthropic.claude-code