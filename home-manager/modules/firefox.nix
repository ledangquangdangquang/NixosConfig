{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.apps.firefox;
in {
  options.apps.firefox = {
    enable = mkEnableOption "Enable Firefox with custom search and extensions.";
    cac = mkOption {
      type = types.bool;
      default = false;
      description = "Enable CAC support.";
    };
  };

  config = mkIf cfg.enable {
    programs.firefox = {
      enable = true;

      profiles = {
        default = {
          id = 0;
          name = "default";
          isDefault = true;

          search = {
            force = true;
            default = "Google";
            order = [ "Google" "Searx" ];
            engines = {
              "Nix Packages" = {
                urls = [{
                  template = "https://search.nixos.org/packages";
                  params = [
                    { name = "type"; value = "packages"; }
                    { name = "query"; value = "{searchTerms}"; }
                  ];
                }];
                icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                definedAliases = [ "@np" ];
              };

              "NixOS Wiki" = {
                urls = [{ template = "https://nixos.wiki/index.php?search={searchTerms}"; }];
                iconUpdateURL = "https://nixos.wiki/favicon.png";
                updateInterval = 24 * 60 * 60 * 1000;
                definedAliases = [ "@nw" ];
              };

              "Searx" = {
                urls = [{ template = "https://searx.aicampground.com/?q={searchTerms}"; }];
                iconUpdateURL = "https://nixos.wiki/favicon.png";
                updateInterval = 24 * 60 * 60 * 1000;
                definedAliases = [ "@searx" ];
              };

              "Bing".metaData.hidden = true;
              "Google".metaData.alias = "@g";
            };
          };

          extensions = with pkgs.nur.repos.rycee.firefox-addons; [
            ublock-origin
            bitwarden
            vimium
            tampermonkey
          ];
        };
      };
    };

    # CAC hỗ trợ — chỉ là TODO nếu cần mở rộng sau
    # Bạn có thể xử lý thêm ở đây nếu cfg.cac == true
  };
}
