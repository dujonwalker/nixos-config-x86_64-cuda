# NixOS Configuration Backup

This repository contains the configuration for my NixOS installation. The purpose is to maintain this config file on a personal Gitea instance for backup and for quick and easy restores. Below is a detailed breakdown of what this configuration sets up once it's run on a new NixOS install.

## System Configuration

- **Networking**: NetworkManager is enabled and the hostname is set to "nixos".
- **Time Zone**: Set to "America/New_York".
- **Locale**: Default locale is "en_US.UTF-8", with additional locale settings.
- **X Server**: Enabled with SDDM display manager and Plasma 6 desktop environment.
- **Printing**: Printing services are enabled.
- **Audio**: PipeWire is enabled with ALSA support, and PulseAudio is disabled.
- **User**: A user named "user" is created, with additional software packages installed.
- **Flatpak**: Enabled to allow installation of Flatpak applications.
- **Systemd Service**: A custom systemd service is set up to install various Flatpak applications automatically after the network is online.
- **State Version**: Set to "24.05" to avoid warnings.

## Applications

This section provides a list of the key applications installed on the system along with a brief description of what each does.

### System Utilities
- **cifs-utils**: Provides tools for mounting and managing CIFS (SMB) network file systems.
- **parted**: A partition manipulation program.
- **mc**: Midnight Commander, a visual file manager.
- **openssl**: A robust, full-featured open-source toolkit implementing the Secure Sockets Layer (SSL) and Transport Layer Security (TLS) protocols.

### Development Tools
- **git**: A distributed version control system.
- **vscode-with-extensions**: Visual Studio Code with extensions for Python, Docker, and Remote SSH.

### Graphics and Multimedia
- **krita**: A professional FREE and open-source painting program.
- **digikam**: An advanced digital photo management application.
- **gimp-with-plugins**: A free and open-source image editor with additional plugins.
- **vlc**: A free and open-source cross-platform multimedia player.
- **mpv**: A free, open-source, and cross-platform media player.
- **obs-studio**: Open Broadcaster Software, a free and open-source software for video recording and live streaming.
- **obs-cli**: A command-line interface for OBS Studio.
- **obs-do**: A plugin for OBS Studio to add additional functionalities.
- **obs-studio-plugins.obs-ndi**: NDI plugin for OBS Studio.
- **obs-studio-plugins.obs-tuna**: Now Playing plugin for OBS Studio.
- **obs-studio-plugins.obs-pipewire-audio-capture**: PipeWire audio capture plugin for OBS Studio.
- **upscayl**: AI-powered image upscaling application.
- **converseen**: A batch image converter and resizer.

### Office and Productivity
- **libreoffice-qt6-fresh**: A powerful office suite that includes several applications for document editing, spreadsheets, presentations, and more.
- **nextcloud-client**: A desktop client for Nextcloud, a suite of client-server software for creating and using file hosting services.
- **obsidian**: A powerful knowledge base that works on top of a local folder of plain text Markdown files.
- **mattermost-desktop**: An open-source, self-hostable online chat service.
- **notepad-next**: A fast, lightweight, and powerful code editor.
- **appflowy**: An open-source alternative to Notion.
- **notepadqq**: A Notepad++-like editor for Linux.
- **koodo-reader**: An open-source eBook reader.
- **qownnotes**: A plain-text file notepad with markdown support and todo list manager.

### Web Browsers
- **falkon**: A KDE web browser using QtWebEngine.
- **floorp**: A privacy-focused Firefox fork.
- **ungoogled-chromium**: A lightweight approach to removing Google web service dependency from Chromium.
- **librewolf**: A fork of Firefox, focused on privacy, security, and freedom.

### Communication
- **discord**: A VoIP, instant messaging, and digital distribution platform.
- **kdeconnect**: Allows your devices to communicate (e.g., your phone and your computer).

### Virtualization
- **virt-manager**: A desktop user interface for managing virtual machines.
- **qemu_kvm**: A generic and open-source machine emulator and virtualizer.

### Miscellaneous
- **winetricks**: A helper script to download and install various redistributable runtime libraries needed to run some programs in Wine.
- **cudaPackages.cudatoolkit**: NVIDIA CUDA Toolkit.
- **wineWowPackages.staging**: Provides the latest Wine Staging packages for running Windows applications.
- **appimage-run**: A tool to run AppImage applications.
- **switcheroo**: A simple application to convert between different image filetypes and resize them easily.
- **p7zip**: A file archiver with a high compression ratio.

## How to Run the Configuration

After logging into NixOS for the first time, follow these steps to apply this configuration:

1. **Download the Configuration File**:
    ```sh
    curl -kLO https://your-gitea-instance/user/nixos-config-x86_64-cuda-github.git/raw/branch/main/configuration.nix
    ```

2. **Copy the Configuration File**:
    ```sh
    sudo cp configuration.nix /etc/nixos/configuration.nix
    ```

3. **Apply the Configuration**:
    ```sh
    sudo nixos-rebuild switch --verbose
    ```

This will pull the configuration from the Gitea instance and apply it to the system.

## To-do

 - [ ] Add Firefox bookmarks
 - [ ] Add notifications via ntfy
 - [ ] Update Ollama

### Tips
- **View Logs**:
    ```sh
    sudo journalctl -f
    ```
This command is useful for monitoring system logs live, allowing you to see messages as they occur, which can be helpful for troubleshooting and debugging issues in real time.

- **Update Nix Channels**:
    ```sh
    sudo nix-channel --update
    ```
By updating the channels, you ensure that your system can access the latest packages and updates defined in configured channels.

- **Clean Garbage**:
    ```sh
    sudo nix-collect-garbage -d
    ```
This helps free up disk space by removing files that are no longer in use.
