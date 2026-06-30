# SBX-VSCODE
A [Docker Sandbox](https://docs.docker.com/ai/sandboxes/) [Kit](https://docs.docker.com/ai/sandboxes/customize/kits/) that installs VSCode and the Claude Code VSCode Extension into the Docker sandbox.

## Use Cases

The main use-case for this sandbox kit is to easily create a new claude sandbox in a project directory and create a VSCode tunnel so the user can work on the project using their local VSCode installation and the VSCode Claude Code extension.

## Requirements

You must already have Docker Sandboxes and the `sbx` command installed - See the [Getting Started](https://docs.docker.com/ai/sandboxes/get-started/) page for installation instructions.

You'll need a Docker account to use `sbx`.  You must first login to Docker with the `sbx login` command.

You'll need a GitHub account in order to start a tunnel.

## Installation

You can clone this kit to your machine:

```
git clone https://github.com/TriticeaeToolbox/sbx-vscode /path/to/sbx-vscode
```

You can use the `sbx-vscode` helper script to start new sandboxes and tunnels.  It may be helpful to link the helper script to a directory in your `$PATH`:

```
ln -s /path/to/sbx-vscode/sbx-vscode /usr/local/bin/sbx-vscode
```

To manually use the kit (without using the helper script), either:
- append the `--kit /path/to/sbx-vscode` argument to your `sbx run` command when creating a new sandbox
- add the kit to an existing sandbox with `sbx kit add my-sandbox /path/to/sbx-vscode`

## Usage

### Starting a Tunnel

The `sbx-vscode` helper script can be used to create a new sandbox and start a VSCode tunnel within the Sandbox:

To start a sandbox and a tunnel in the current working directory:

```
sbx-vscode -t
```

To start a sandbox and a tunnel in a different project directory:

```
sbx-vscode -t /path/to/project
```

After starting the tunnel, you'll see a message in the console with a link and code to grant access to the VSCode server running in the sandbox

```
*
* Visual Studio Code Server
*
* By using the software, you agree to
* the Visual Studio Code Server License Terms (https://aka.ms/vscode-server-license) and
* the Microsoft Privacy Statement (https://privacy.microsoft.com/en-US/privacystatement).
*
[2026-06-30 18:38:22] info Using GitHub for authentication, run `code tunnel user login --provider <provider>` option to change this.
To grant access to the server, please log into https://github.com/login/device and use code ****-****
```

You'll need to go to https://github.com/login/device and enter the code displayed.

### Connecting to a Tunnel

Once you've authenticated with GitHub, you'll see that the tunnel is up and running:

```
[2026-06-30 18:40:31] info Creating tunnel with the name: claude-sgn

  Visual Studio Code Tunnel v1.126.0

  ➜  Tunnel:   claude-sgn
  ➜  Open:  https://vscode.dev/tunnel/claude-sgn/home/djw64/Development/breedbase-dev/sgn
```

You can connect to the tunnel by either:

- Opening the URL provided in a browser to use a web-based VSCode
- Use the [Remote - Tunnels](https://marketplace.visualstudio.com/items?itemName=ms-vscode.remote-server) extension in your desktop VSCode installation
    - Make sure the **Remote - Tunnels** extension is installed
    - Open the **Remote Explorer** sidebar
    - Under **Tunnels**, make sure you are signed in with your GitHub account
    - You should see the name of your Tunnel listed
    - Use the arrow or folder buttons to open your project in either the current or new window

The Claude Code extension should already be installed on the server.

The first time you use Claude Code in a sandbox you'll need to login with your Claude account.
