FROM docker/sandbox-templates:claude-code-docker


USER root

# Install VSCode
RUN apt-get update && apt-get install -y wget gpg
RUN wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor -o /usr/share/keyrings/microsoft.gpg
COPY ./vscode.sources /etc/apt/sources.list.d/vscode.sources
RUN apt-get update && apt-get install -y code


USER agent

# Install the Claude Code Extension
RUN code --install-extension anthropic.claude-code
