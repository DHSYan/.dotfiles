{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  console.useXkbConfig = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nixpkgs.config.allowUnfree = true;

  # networking.hostName = "nixos"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Australia/Sydney";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.autorun = false;
  services.xserver.displayManager.startx.enable = true;
  services.xserver.dpi = 110;

  services.xserver.windowManager.dwm.enable = true;
  # DWM Overlay
  nixpkgs.overlays = [
  	(final: prev: {
		dwm = prev.dwm.overrideAttrs (old: { src = /home/tzen/.dotfiles/dwm-stuff/dwm ;});
	})
  ];

  # I hate that I have to put this here, because what if I am on system with different GPU..
  hardware.opengl = {
  	enable = true;
	driSupport = true;
	driSupport32Bit = true;
  };
  #services.xserver.videoDrivers = [ "nvidia" ];
  #hardware.nvidia = {
  #	modesetting.enable = true;
  #      powerManagement.enable = false;
  #      powerManagement.finegrained = false;
  #      open = false;
  #      nvidiaSettings = true;
  #      package = config.boot.kernelPackages.nvidiaPackages.stable;
  #};

  # Configure keymap in X11
  services.xserver.xkb.layout = "us";
  services.xserver.xkb.variant = "dvorak";
  services.xserver.xkb.options = "caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;


  programs.zsh.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.tzen = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
    ];
  };

  nixpkgs.config.permittedInsecurePackages = [
	  "electron-25.9.0"
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
   environment.systemPackages = with pkgs; [
     dmenu
     wezterm
     google-chrome
     gcc
     clang
     neovim 
     ripgrep
     tldr
     tmux
     unzip
     wget
     git
     xclip
     xorg.xdpyinfo
     xorg.xinput
     xorg.xev
     feh
     zsh
     fzf
     sxhkd
     texliveSmall
     racket
     neofetch
     libfido2
     sshfs-fuse
     xorg.xsetroot
     spotify
     discord
     lua
     luajit
     gnumake
     cmake
     unzip
     gnutar
     curl
     wget
     obsidian # need to enable some electron package
     localsend
     xournalpp
     thunderbird
     flameshot
     tlp
   ];

   environment.variables = rec {
	XDG_CONFIG_HOME = "$HOME/.config";
	ZDOTDIR = "$HOME/.config/zsh";
   };

   fonts.packages = with pkgs; [
     (nerdfonts.override { fonts = [ "Hermit" "Iosevka" "JetBrainsMono" "Terminus"];})
   ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "23.11"; # Did you read the comment?
  
  # Laptop Section
  powerManagement = {
  	enable = true;
  };
  services.tlp = {
  	enable = true;
	settings = {
		CPU_SCALING_GOVERNOR_ON_AC = "performance";
		CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

		CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
		CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

		CPU_MIN_PERF_ON_AC = 0;
		CPU_MAN_PERF_ON_AC = 100;
		CPU_MIN_PERF_ON_BAT = 0;
		CPU_MAN_PERF_ON_BAT = 20;

		START_CHARGE_THRESH_BAT0 = 40;
		STOP_CHARGE_THRESH_BAT0 = 80;

	};
  };
  services.thermald.enable = true;

}

