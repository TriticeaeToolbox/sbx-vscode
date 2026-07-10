# sbx-vscode

A [Docker Sandbox](https://docs.docker.com/ai/sandboxes/) [kit](https://docs.docker.com/ai/sandboxes/customize/kits/) that puts VS Code and the Claude Code extension inside a sandbox.

## What it does

The kit runs your project in a walled-off Docker sandbox and opens a VS Code tunnel into it. You work in VS Code on your Mac, while Claude Code runs safely inside the sandbox.

## What you need

- A Mac with Apple silicon. The image builds for `arm64` only, not `amd64`.
- The `sbx` command. See the [get-started guide](https://docs.docker.com/ai/sandboxes/get-started/).
- A Docker account. Sign in with `sbx login`.
- A GitHub account, to open the tunnel.
- The `gh` CLI, signed in with `gh auth login`, to give the sandbox a push token.
- A Claude subscription, not an API key.

## Install

- Clone the repository and build the image:

  ```bash
  git clone https://github.com/lars20070/sbx-vscode
  cd sbx-vscode
  ./sbx-vscode-build
  ```

  The script builds the image on your Mac and loads it as an `sbx` template. It pulls nothing from a registry. Run it again each time you change the `Dockerfile`.

- Give the sandbox a GitHub token once. The sandbox blocks SSH (port 22), so the image routes GitHub over HTTPS. The token lets it push:

  ```bash
  gh auth token | sbx secret set -g github
  ```

## Use

- Start the sandbox and open a tunnel for your project:

  ```bash
  ./sbx-vscode /path/to/repo
  ```

- Grant access to the server. The script prints a link and a code. Open the link and type the code:

  ```
  To grant access to the server, please log into https://github.com/login/device and use code ****-****
  ```

- On your Mac, open VS Code and add the [Remote - Tunnels](https://marketplace.visualstudio.com/items?itemName=ms-vscode.remote-server) extension. Sign in with the same GitHub account, then connect to the tunnel. The tunnel is named `claude-<project>` — for example, `/path/to/repo` becomes `claude-repo`.

- Open the Claude Code panel and sign in to your Claude account.
