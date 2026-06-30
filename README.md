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

The `sbx-vscode` helper script can be used to create a new sandbox and start a VSCode tunnel within the Sandbox:

To start a sandbox and a tunnel in the current working directory:

```
sbx-vscode -t
```

To start a sandbox and a tunnel in a different project directory:

```
sbx-vscode -t /path/to/project
```

To start 
