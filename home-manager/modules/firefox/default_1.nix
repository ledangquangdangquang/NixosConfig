{ config, pkgs, firefox-addons, ... }:

  let
    lock-false = {
      Value = false;
      Status = "locked";
    };
    lock-true = {
      Value = true;
      Status = "locked";
    };
  in
{
  home.file.".mozilla/firefox/profile_0/user.js".source = ./FirefoxCss/user.js;
  home.file.".mozilla/firefox/profile_0/chrome/userChrome.css".source = ./FirefoxCss/chrome/userChrome.css;
  home.file.".mozilla/firefox/profile_0/chrome/userContent.css".source = ./FirefoxCss/chrome/userContent.css;

  programs = {
    firefox = {
      enable = true;
      package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
        extraPolicies = {
          DisableTelemetry = true;
          # add policies here...

          /* ---- EXTENSIONS ---- */
          ExtensionSettings = {
            # "*".installation_mode = "blocked"; # blocks all addons except the ones specified below
            # uBlock Origin:
            "uBlock0@raymondhill.net" = {
              install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
              installation_mode = "force_installed";
            };
	    # Vimium 
            "{d7742d87-e61d-4b78-b8a1-b469842139fa}" = {
              install_url = "https://addons.mozilla.org/firefox/downloads/file/4524018/vimium_ff-2.3.xpi";
              installation_mode = "force_installed";
            };
	    # Tampermonkey
            "firefox@tampermonkey.net" = {
              install_url = "https://addons.mozilla.org/firefox/downloads/file/4405733/tampermonkey-5.3.3.xpi";
              installation_mode = "force_installed";
            };
	    # Bitwarden
            "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
              install_url = "https://addons.mozilla.org/firefox/downloads/file/4525374/bitwarden_password_manager-2025.6.1.xpi";
              installation_mode = "force_installed";
            };
	    # Authenticator
            "authenticator@mymindstorm" = {
              install_url = "https://addons.mozilla.org/firefox/downloads/file/4353166/auth_helper-8.0.2.xpi";
              installation_mode = "force_installed";
            };
          };
  
          /* ---- PREFERENCES ---- */
          # Set preferences shared by all profiles.
          Preferences = { 
            "browser.contentblocking.category" = { Value = "strict"; Status = "locked"; };
            "extensions.pocket.enabled" = lock-false;
            "extensions.screenshots.disabled" = lock-true;
	    "layout.css.prefers-color-scheme.content-override"  = 0;
          };
        };
      };

      /* ---- PROFILES ---- */
      # Switch profiles via about:profiles page.
      # For options that are available in Home-Manager see
      # https://nix-community.github.io/home-manager/options.html#opt-programs.firefox.profiles
      profiles ={
        profile_0 = {           # choose a profile name; directory is /home/<user>/.mozilla/firefox/profile_0
          id = 0;               # 0 is the default profile; see also option "isDefault"
          name = "profile_0";   # name as listed in about:profiles
          isDefault = true;     # can be omitted; true if profile ID is 0
          settings = {          # specify profile-specific preferences here; check about:config for options
            "browser.newtabpage.activity-stream.feeds.section.highlights" = false;
            "browser.startup.homepage" = "about:home";
          };
		search = {
			default = "google"; 

		 engines = {
	      "Nix Packages" = {
		urls = [
		  {
		    template = "https://search.nixos.org/packages";
		    params = [
		      { name = "channel"; value = "unstable"; }
		      { name = "query";   value = "{searchTerms}"; }
		    ];
		  }
		];
		icon           = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
		definedAliases = [ "@np" ];
	      };

	      "Nix Options" = {
		urls = [
		  {
		    template = "https://search.nixos.org/options";
		    params = [
		      { name = "channel"; value = "unstable"; }
		      { name = "query";   value = "{searchTerms}"; }
		    ];
		  }
		];
		icon           = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
		definedAliases = [ "@no" ];
	      };

	      "NixOS Wiki" = {
		urls = [
		  {
		    template = "https://wiki.nixos.org/w/index.php";
		    params = [
		      { name = "search"; value = "{searchTerms}"; }
		    ];
		  }
		];
		icon           = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
		definedAliases = [ "@nw" ];
	      };
	    };
		};
	};
        profile_1 = {
          id = 1;
          name = "profile_1";
          isDefault = false;
          settings = {
            "browser.newtabpage.activity-stream.feeds.section.highlights" = true;
            "browser.startup.homepage" = "https://ecosia.org";
            # add preferences for profile_1 here...
          };
        };
      # add profiles here...
      };
    };
  };
}
