{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./flatpaks.nix
    ./firefox.nix
  ];

  # Boot loader configuration
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_6_8;
  boot.initrd.kernelModules = [ "nvidia" ];
  boot.extraModulePackages = [ config.boot.kernelPackages.nvidia_x11 ];
  boot.blacklistedKernelModules = [ "nouveau" ];

  networking.hostName = "studio-dev";
  networking.networkmanager.enable = true;

  time.timeZone = "America/New_York";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.videoDrivers = ["nvidia"];

  # Enable the KDE Plasma Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma6.enable = true;

  # Enable XDG Desktop Portals
  xdg.portal.enable = true;

  services.printing.enable = true;

  # Enable graphics driver
  hardware.opengl = {
    enable = true;
    driSupport = true;
  };

  # Enable Nvidia hardware
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    #package = config.boot.kernelPackages.nvidiaPackages.production;
  };

  hardware.nvidia.prime = {
    offload = {
      enable = true;
      enableOffloadCmd = true;
      };
    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:0:0:2";
  };

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Enable "normal" binaries
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # Add any missing dynamic libraries for unpackaged programs here, NOT in environment.systemPackages
  ];

  # Enable Firefox
  programs.firefox.enable = true;

  # Allow installation of unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable CUDA
  nixpkgs.config.cudaSupport = true;

  # Enable Flatpak
  services.flatpak.enable = true;

  # System-wide apps
  environment.systemPackages = with pkgs; [
    cifs-utils
    cudaPackages.cudatoolkit
    wineWowPackages.staging
    #wineWowPackages.waylandFull
    winetricks
    virt-manager
    kdePackages.kate
    kdePackages.falkon
    kdePackages.kcalc
    kdePackages.kfind
    kdePackages.kdenlive
    kdePackages.isoimagewriter
    krita
    digikam
    openssl
    appimage-run
    parted
    mc
    floorp
    nextcloud-client
    libreoffice-qt6-fresh
    #onlyoffice-bin_latest
    obsidian
    mattermost-desktop
    notepad-next
    appflowy
    notepadqq
    koodo-reader
    obs-studio
    obs-cli
    obs-do
    obs-cmd
    obs-studio-plugins.obs-ndi
    obs-studio-plugins.obs-tuna
    obs-studio-plugins.obs-pipewire-audio-capture
    gimp-with-plugins
    vlc
    mpv
    discord
    p7zip
    qownnotes
    switcheroo
    ungoogled-chromium
    librewolf
    upscayl
    converseen
    (vscode-with-extensions.override {
    # When the extension is already available in the default extensions set.
      vscodeExtensions = with vscode-extensions; [
        ms-python.python
        ms-azuretools.vscode-docker
        ms-vscode-remote.remote-ssh
      ];
      })
    #xscreensaver
    #darktable
    #warp-terminal
    ];

  services.ollama = {
    enable = true;
    acceleration = "cuda"; # Or "rocm"
  };

  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
      ovmf = {
        enable = true;
        packages = [(pkgs.OVMF.override {
          secureBoot = true;
          tpmSupport = true;
        }).fd];
      };
    };
  };

  programs.kdeconnect = {
    enable = true;
  };

  # "dujo" user settings
  users.users.dujo = {
    isNormalUser = true;
    description = "Dujo";
    extraGroups = [ "networkmanager" "wheel" "video" "input" "libvirtd" ];
    packages = with pkgs; [
      #Insert pkgs here
      git
    ];
  };

  # Set the state version to avoid warnings
  system.stateVersion = "24.05"; # Set this to the version you are using

  # Enable automatic system upgrades
  system.autoUpgrade = {
  enable = true;
#  flake = inputs.self.outPath;
  flags = [
    "--update-input"
    "nixpkgs"
    "--print-build-logs"
  ];
  dates = "02:00";
  randomizedDelaySec = "45min";
  };

  # Turn on periodic optimisation of the nix store
  nix.optimise.automatic = true;

  # Turn on automatic garbage collection
  nix.gc = {
  automatic = true;
  dates = "weekly";
  options = "--delete-older-than 30d";
  };

  # Add additional configurations or packages here as needed
}
