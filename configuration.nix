# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      # Hardware configuration
      ./hardware-configuration.nix

      # Core modules
      ./modules/core/packages.nix
      ./modules/core/hosts.nix
      ./modules/core/nic.nix
      ./modules/core/mounts.nix
      ./modules/core/font.nix

      # Desktop modules
      ./modules/desktop/niri.nix
      ./modules/desktop/nvidia.nix
      ./modules/desktop/greeter.nix
    ];

  # Enable flakes and error experimental with new Nix CLI
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

# Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # NetworkManager for internet / normal LAN
  networking.networkmanager.enable = true;

  networking.hostName = "arizona"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Set your time zone.
  time.timeZone = "Asia/Jakarta";

  # Power management daemon
  services.upower.enable = true;

  # Virtual filesystem support for network drives, USB, trash, and sidebar integration
  services.gvfs.enable = true;

  # Enable USB automount and removable media support
  services.udisks2.enable = true;

  # Thumbnail generation service for images, videos, and documents in Thunar
  services.tumbler.enable = true;

  # Enable dconf for GTK applications and settings persistence
  programs.dconf.enable = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Generate standard user folders like Downloads, Pictures, Videos, etc.
    xdg.userDirs = {
      enable = true;
      createDirectories = true;
  };

  # Enable low-latency audio scheduling
  security.rtkit.enable = true;
  
  # Pipewire Linux audio stack
  services.pipewire = {
    enable = true;

    # ALSA Support audio
    alsa.enable = true;
    alsa.support32Bit = true;

    # PulseAudio compatibility layer
    pulse.enable = true;

    # PipeWire session and device manager
    wireplumber.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.oscarfaldi = {
    isNormalUser = true;
    description = "Oscar Faldi";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Activate polkit authentication agent
  security.polkit.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Syncthing file synchronization service
  services.syncthing = {
    enable = true;

    user = "oscarfaldi";
    dataDir = "/home/oscarfaldi";
    configDir = "/home/oscarfaldi/.config/syncthing";

    openDefaultPorts = true;
  };

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?

}
