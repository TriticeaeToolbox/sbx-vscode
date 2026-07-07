# SBX-VSCODE
This [Docker Sandbox](https://docs.docker.com/ai/sandboxes/) [Kit](https://docs.docker.com/ai/sandboxes/customize/kits/) installs VSCode and the Claude Code extension into the Docker sandbox.

## Use Cases

The main use-case for this sandbox kit is to easily create a new claude sandbox in a project directory and create a VSCode tunnel so the user can work on the project using their local VSCode installation and the VSCode Claude Code extension.

## Requirements

- macOS host system (no `amd64` support)
- Docker Sandbox `sbx` [installation](https://docs.docker.com/ai/sandboxes/get-started/)
- Docker account. Sign in with `sbx login`.
- GitHub account in order to start the tunnel.
- Claude Code subscription (not API key access).

## Installation

Clone the repo and run the build script.

```
./sbx-vscode-build
```

Note that the Docker image is built locally. No download from registry required.

## Usage

- Start the sandbox.

  ```bash
  ./sbx-vscode /path/to/myrepo
  ```

- Grant access to the VSCode server by following the link and copy the code.

  ```
  To grant access to the server, please log into https://github.com/login/device and use code ****-****
  ```

- Open the VSCode IDE on your host system and the [Remote - Tunnels](https://marketplace.visualstudio.com/items?itemName=ms-vscode.remote-server) extension. Then `Connect to Tunnel ...` with your GitHub account. You should see a tunnel `claude-<myrepo>`.

- In the Claude Code panel, sign into your Claude account.
