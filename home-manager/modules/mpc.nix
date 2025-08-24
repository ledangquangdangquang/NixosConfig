{
  pkgs,
  config,
  ...
}: {
  services.mpd = {
    enable = true;
    musicDirectory = "${config.home.homeDirectory}/Music";
    network.listenAddress = "127.0.0.1";
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "Pipewire"
      }
    '';
  };

  # programs.mpc.enable = true;
}
