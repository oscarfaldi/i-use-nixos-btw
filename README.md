# i-use-nixos-btw

Here is my personal NixOS declarative configuration.

This repository contains my complete desktop setup, development environment, personal scripts, dotfiles, wallpapers, and system configuration.

The system is built around:

- NixOS
- Home Manager
- Niri (Wayland compositor)
- Thunar
- Ghostty
- Waybar
- Fuzzel
- Mako

Unlike traditional Linux setups where configuration is spread across `/etc`, `~/.config`, and various application directories, this repository acts as the single source of truth for nearly everything.

Most configuration files, scripts, themes, wallpapers, and application settings live inside `~/System` and are managed declaratively through NixOS and Home Manager.

## Hardware

This configuration is primarily built and tested on:

- AMD Ryzen 5 5600
- NVIDIA RTX 3060 Ti
- 32GB DDR4 RAM

NVIDIA-specific configuration is included.

# Philosophy

This repository follows a simple principle:

> `~/System` is the single source of truth.

Instead of scattering configuration across `/etc`, `~/.config`, and application-specific directories, almost everything lives inside this repository and is managed through NixOS and Home Manager.

The goal is reproducibility. A fresh machine should be able to become my daily workstation with minimal manual setup.

## Editing Configuration

Never edit generated files inside `~/.config` directly.

Instead, edit the source files inside:

```text
~/System/.config
```

Home Manager creates the necessary symlinks automatically.

## Quick Access

The fastest workflow is through **Fuzzel**.

From the launcher, jump directly into **Yazi** inside the repository and edit files from there.

For GUI editing, **Mousepad** can open files inside `~/System` without running into permission issues, since the repository is owned by the user rather than root.

## Golden Rules

- Edit `~/System`, not generated locations.
- Rebuild instead of manually fixing configuration.
- Keep configuration deterministic.
- If something requires an imperative step, document why.

## Installation

### 1. Install NixOS

Install a fresh copy of NixOS without a desktop environment.

This repository already provides the complete desktop environment, window manager, applications, and user configuration, so KDE, GNOME, XFCE, or any other desktop environment is unnecessary.

After installation completes, reboot into the newly installed system.

### 2. Install Git and clone the repository

Log in from the console and temporarily install Git:

```bash
nix-shell -p git
```

Clone the repository:

```bash
git clone https://github.com/oscarfaldi/i-use-nixos-btw ~/System
```

The repository is intentionally cloned into `~/System`.

`~/System` serves as the central location for the entire machine configuration. Most dotfiles, scripts, themes, wallpapers, and Home Manager managed configuration live here instead of being edited directly inside `~/.config`.

Home Manager creates symlinks where necessary, making the repository the primary location for configuration changes.

### 3. Prepare the installer

Move into the repository:

```bash
cd ~/System
```

Make the installation script executable:

```bash
chmod +x install
```

### 4. Run the installer

```bash
./install
```

The installation script performs the initial bootstrap process:

- Imports the generated hardware configuration into the repository
- Removes the default `/etc/nixos` configuration to avoid configuration drift
- Moves the system to the latest NixOS unstable channel
- Installs and configures Home Manager
- Configures SMB credentials for network shares
- Restores selected application settings
- Performs the initial system build
- Reboots the machine automatically

After installation, the repository becomes the primary source of truth for the system.

### 5. Rebuild after reboot

Once the system comes back online:

```bash
rebuild
```

or

```bash
sudo nixos-rebuild switch
```

The machine should now be fully configured.

# Repository Structure

This repository is organized by responsibility instead of putting everything into a single `configuration.nix`.

Each directory has a specific purpose.

## Overview

| Directory | Purpose |
|----------|---------|
| `.config/` | Dotfiles and application configuration |
| `.local/share/applications/` | Custom desktop launchers |
| `home/` | Home Manager configuration |
| `modules/` | NixOS modules |
| `scripts/` | Custom automation scripts |

---

## `.config`

This is where most user-facing configuration lives.

Think of this as the equivalent of the traditional `~/.config`, except the real source files live inside the repository and are linked by Home Manager.

It contains configuration for:

- Niri
- Waybar
- Ghostty
- MPV
- Yazi
- Fuzzel
- Mako
- Zsh
- Starship
- and other applications.

Most ricing, UI customization, and application behavior is defined here.

### `.config/assets`

Assets are kept inside the repository so the entire desktop remains reproducible.

This includes:

- Wallpapers
- Icons
- Notification sounds

Even notification sounds are stored here because they're referenced by other configuration files, making the setup fully self-contained.

---

## `.local/share/applications`

This directory contains custom desktop launchers.

Instead of accepting default application launchers, I customize them to better match my workflow.

Typical use cases include:

- hiding launchers I never use
- replacing default launch behavior
- creating workflow-specific shortcuts

### Example: Counter-Strike 2 Launcher

The custom CS2 launcher automatically:

- launches `nvibrant`
- increases digital vibrance
- switches compatibility to X11 (Wayland can cause issues)
- starts the game
- restores everything automatically when the game exits

From the user's perspective, it's just one launcher.

---

## `home`

This directory contains Home Manager configuration.

Home Manager declaratively manages user-level configuration that would normally live inside the home directory.

One important file is `files.nix`.

Instead of copying configuration files manually, it creates symlinks into the repository.

For example:

- `~/.config/niri`
- `~/.config/ghostty`
- `~/.config/zsh`
- `~/.config/assets`

all point back to their equivalents inside `~/System`.

This keeps configuration editable from one place while still allowing applications to use their expected locations.

---

## `modules`

`modules` contains the actual NixOS configuration.

Rather than keeping one massive configuration file, the system is split into smaller modules grouped by purpose.

Examples include:

| Module | Purpose |
|--------|---------|
| `games.nix` | Steam and gaming configuration |
| `appearance.nix` | Fonts, themes, cursors, and styling |
| `chromium-policy.nix` | Declarative Chromium policies |
| `network.nix` | NetworkManager, local DNS, and network automation |

This makes individual parts of the system easier to maintain and reuse.

## `modules/network.nix`

This module keeps the entire network configuration declarative.

Instead of manually creating NetworkManager profiles through a GUI, every connection is defined in Nix.

### Network Layout

| Network | Purpose |
|---------|---------|
| `10.10.10.x` | Internet and Unraid management |
| `10.10.20.x` | Intel X540-T2 Port 1 (10G) |
| `10.10.21.x` | Intel X540-T2 Port 2 (10G) |

The standard LAN handles internet access and management, while the two dedicated 10Gb interfaces are reserved for high-speed NAS traffic.

### Local Domains

The module also defines local hostname shortcuts.

Instead of remembering IP addresses, services can be accessed through names like:

- `files.local`
- `music.local`
- `movies.local`
- `grafana.local`
- `ai.local`
- `office.local`

These all resolve to the Unraid server at `10.10.10.10`.

### Deterministic NetworkManager

NetworkManager has a habit of accumulating old or temporary connection profiles over time.

This module includes a cleanup service that automatically removes unmanaged profiles while preserving only the expected connections.

The result is:

- predictable network configuration
- no duplicate ethernet profiles
- less GUI clutter
- reproducible networking after rebuilds

# Scripts

One of my favorite parts of Linux is how repetitive tasks can become permanent workflow improvements.

Instead of installing separate applications for every small task, most common actions are standardized into scripts that integrate directly with Thunar, Fuzzel, or the terminal.

The goal is simple:

> Build it once, use it everywhere.

The scripts are grouped by responsibility rather than by programming language.

## Structure

| Directory | Purpose |
|----------|---------|
| `actions/` | File operations and Thunar workflow |
| `apps/` | Application launch wrappers |
| `launchers/` | Fuzzel menu shortcuts |
| `systems/` | System maintenance |
| `themes/` | Wallpaper and theme automation |

## `actions`

This folder contains scripts designed around file management.

Most of them are exposed through **Thunar Custom Actions**, turning right-click actions into reusable workflows.

Instead of opening dedicated applications, the file manager becomes the interface.

### Inspect File

The `inspect-file` script is a universal metadata inspector.

It combines multiple tools behind a single interface:

- ExifTool
- FFprobe
- PDFInfo
- XDG MIME detection
- Zenity

Depending on the selected file type, it automatically displays relevant information.

Examples include:

- Camera metadata
- GPS coordinates
- Video codecs
- HDR format
- Audio quality
- PDF information
- Office document metadata
- File permissions

Instead of opening multiple utilities, everything appears inside a single window.

### MKV Compress

This is my primary long-term video compression workflow.

Originally I relied on Unmanic running on my Unraid NAS, but I eventually preferred running the entire workflow directly on my desktop.

Features:

- NVIDIA NVENC HEVC encoding
- Constant QP quality
- Audio stream copy
- Folder support
- Multiple file support
- Progress window inside Ghostty
- Desktop notifications
- Preserves original timestamps

Output:

```text
filename-encoded.mkv
```

The script is intentionally designed for archival rather than streaming optimization.

### Video Rotation

Simple FFmpeg wrappers rotate videos without opening an editor.

Common use cases include:

- Landscape → Portrait
- Portrait → Landscape

The output is generated directly from Thunar.

### Image Conversion

Image conversion is standardized into dedicated scripts.

Supported output formats include:

- AVIF
- JPEG
- PNG
- PDF

Depending on the target format, the backend changes automatically.

- `avifenc` for AVIF
- ImageMagick for image formats
- Pandoc where document conversion is appropriate

Batch conversion is supported, making it useful for large collections.

## `apps`

These scripts wrap existing applications into more convenient entry points.

Instead of launching programs directly, they prepare the environment first.

The applications themselves stay unchanged. The launch behavior becomes smarter.

### Counter-Strike 2

The custom CS2 launcher automatically:

- enables NVibrant
- increases digital vibrance
- launches the game under X11
- restores the previous state after exiting

This solves Wayland compatibility issues while keeping the workflow down to a single click.

### Ghostty Wrappers

Some terminal applications automatically open inside Ghostty.

Examples include:

- `btop`
- `yazi`

This keeps terminal tools feeling like standalone applications while preserving a consistent terminal environment.

## `launchers`

These scripts exist primarily for Fuzzel.

Instead of remembering terminal commands, frequently used actions become searchable launcher entries.

Typical examples include:

- opening configuration folders
- jumping into `~/System`
- opening `modules`
- launching Yazi in specific locations
- rebooting
- shutting down

The goal is reducing navigation friction rather than replacing the terminal.

## `themes`

This folder automates desktop appearance.

Instead of manually changing wallpapers or themes, everything becomes keyboard-driven.

### Wallpaper Rotation

`Ctrl + Tab` cycles through wallpapers stored inside:

```text
~/.config/assets/wallpapers
```

The script automatically rotates through the available collection, making wallpaper changes effectively instant.

Keeping wallpapers inside the repository also ensures they remain reproducible across fresh installations.

## `systems`

These scripts replace long administrative commands with predictable shortcuts.

Most of them exist because they're commands I run regularly enough that I no longer want to remember the full syntax.

### `rebuild`

This is the command I use most.

Instead of writing:

```bash
sudo nixos-rebuild switch -I nixos-config=~/System/configuration.nix
```

I simply run:

```bash
rebuild
```

The script always rebuilds using the repository as the active configuration source and prints useful system information afterward.

### `upgrade`

Updates:

- Nix channels
- packages
- system generation

Then rebuilds the system.

### `clean`

Every rebuild creates a new system generation.

`clean` removes old generations and frees storage while keeping the system organized.

### `smart-report`

Generates a complete SMART health report for every installed HDD and SSD.

Useful for periodically checking NAS and desktop drive health without manually querying each disk.

# Decisions

This page documents decisions that future me is most likely to forget.

## Why Niri instead of Hyprland?

Hyprland has the larger ecosystem.

Niri changed how I use my desktop.

Instead of treating one workspace as a crowded desktop, each task naturally moves into its own workspace.

That workflow fits my habits better than stacking multiple windows inside one space.

## Why `~/System` instead of `/etc/nixos`?

Two reasons.

First, `/etc/nixos` constantly requires elevated permissions.

Second, I wanted one repository containing everything:

- Nix configuration
- dotfiles
- wallpapers
- scripts
- assets

One repository. One source of truth.

## Why Home Manager symlinks?

Mostly because it's the native Nix approach.

On traditional Linux distributions I'd probably solve the same problem with GNU Stow.

## Why NixOS unstable?

"Unstable" in NixOS doesn't mean unreliable.

I prefer newer packages, better hardware support, and a faster update cadence.

In practice, it's been stable enough for my daily desktop.

# Devices Hostname

My devices are named after landscapes of the Pacific Northwest.

The Pacific Northwest represents many things I admire: wilderness, mountains, forests, craftsmanship, solitude, exploration, and a slower side of Americana that often exists beyond the major cities.

**Arizona** is not a device. It is the identity behind the system.

**Cascade** serves as the foundation. Named after the Cascade Range, it represents the underlying backbone that everything else depends on. As the NAS, it acts as the source of truth for data, services, media, backups, and infrastructure.

**Rainier** is the primary workstation. Inspired by Mount Rainier, the most prominent peak in the region, it serves as the main machine for work, experimentation, and everyday computing.

**Baker** is the mobile companion. Named after Mount Baker, it represents exploration, flexibility, and the ability to remain connected while operating beyond the desk.

The names are less about geography and more about the roles these machines play within a shared landscape
