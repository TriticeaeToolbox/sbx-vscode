FROM docker.io/docker/sandbox-templates:claude-code-docker

USER root

RUN curl -Lo vscode.deb 'https://update.code.visualstudio.com/latest/linux-deb-arm64/stable' && \
  apt-get update && apt-get install --yes ./vscode.deb && \
  rm ./vscode.deb

USER agent

RUN code --extensions-dir ~/.vscode-server/extensions/ --install-extension anthropic.claude-code

# Inside a sandbox, SSH (port 22) is blocked, so route GitHub over HTTPS (the proxy injects
# credentials for HTTPS). This rewrites git@github.com remotes -- including an SSH `origin`
# shared from the host -- to HTTPS, without touching the host's own Git config.
RUN git config --global url."https://github.com/".insteadOf "git@github.com:" && \
  git config --global url."https://github.com/".insteadOf "ssh://git@github.com/"