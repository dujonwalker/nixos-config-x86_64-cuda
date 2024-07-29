{ config, pkgs, ... }:

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
  programs = {
    firefox = {
      enable = true;
      languagePacks = [ "de" "en-US" ];

      /* ---- POLICIES ---- */
      # Check about:policies#documentation for options.
      policies = {
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
        EnableTrackingProtection = {
          Value = true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
        };
        Homepage = {
          URL = "https://google.ca/";
          Locked = true;
          StartPage = "homepage";
        };
        DisablePocket = true;
#        DisableFirefoxAccounts = true;
#        DisableAccounts = true;
        DisableFirefoxScreenshots = true;
        OverrideFirstRunPage = "";
        OverridePostUpdatePage = "";
        DontCheckDefaultBrowser = true;
        DisplayBookmarksToolbar = "always"; # alternatives: "never" or "newtab"
        DisplayMenuBar = "default-on"; # alternatives: "always", "never" or "default-off"
        SearchBar = "unified"; # alternative: "separate"

        /* ---- EXTENSIONS ---- */
        # Check about:support for extension/add-on ID strings.
        # Valid strings for installation_mode are "allowed", "blocked",
        # "force_installed" and "normal_installed".
        ExtensionSettings = {
          "*".installation_mode = "blocked"; # blocks all addons except the ones specified below
          # uBlock Origin:
          "uBlock0@raymondhill.net" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
            installation_mode = "force_installed";
          };
          # Privacy Badger:
          "jid1-MnnxcxisBPnSXQ@jetpack" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17/latest.xpi";
            installation_mode = "force_installed";
          };
          # Bitwarden:
          "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
            installation_mode = "force_installed";
          };
          # Consent-O-Matic:
          "gdpr@cavi.au.dk" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/consent-o-matic/latest.xpi";
            installation_mode = "force_installed";
          };
          # Lovely forks:
          "github-forks-addon@musicallyut.in" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/lovely-forks/latest.xpi";
            installation_mode = "force_installed";
          };
          # SponsorBlock for YouTube - Skip Sponsorships:
          "sponsorBlocker@ajay.app" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/latest.xpi";
            installation_mode = "force_installed";
          };
          # Plasma Integration:
          "plasma-browser-integration@kde.org" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/plasma-integration/latest.xpi";
            installation_mode = "force_installed";
          };
          # Facebook Container:
          "@contain-facebook" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/facebook-container/latest.xpi";
            installation_mode = "force_installed";
          };
          # DuckDuckGo Privacy Essentials:
          "jid1-ZAdIEUB7XOzOJw@jetpack" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/duckduckgo-for-firefox/latest.xpi";
            installation_mode = "force_installed";
          };
          # floccus bookmarks sync:
          "floccus@handmadeideas.org" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/floccus/latest.xpi";
            installation_mode = "force_installed";
          };
          # linkding extension:
          #"{61a05c39-ad45-4086-946f-32adb0a40a9d}" = {
          #  install_url = "https://addons.mozilla.org/firefox/downloads/latest/linkding-extension/latest.xpi";
          #  installation_mode = "force_installed";
          #};
          # Get RSS Feed URL - Retrieve RSS feeds URLs from a WebSite:
          #"{15bdb1ce-fa9d-4a00-b859-66c214263ac0}" = {
          #  install_url = "https://addons.mozilla.org/firefox/downloads/latest/get-rss-feed-url/latest.xpi";
          #  installation_mode = "force_installed";
          #};
          # Honey:
          #"jid1-93CWPmRbVPjRQA@jetpack" = {
          #  install_url = "https://addons.mozilla.org/firefox/downloads/latest/honey/latest.xpi";
          #  installation_mode = "force_installed";
          #};
          # The Camelizer:
          #"izer@camelcamelcamel.com" = {
          #  install_url = "https://addons.mozilla.org/firefox/downloads/latest/the-camelizer-price-history-ch/latest.xpi";
          #  installation_mode = "force_installed";
          #};
          # Instagram Downloader:
          #"1094918@gmail.com" = {
          #  install_url = "https://addons.mozilla.org/firefox/downloads/latest/ins-downloader/latest.xpi";
          #  installation_mode = "force_installed";
          #};
          # Download All Images:
          #"{32af1358-428a-446d-873e-5f8eb5f2a72e}" = {
          #  install_url = "https://addons.mozilla.org/firefox/downloads/latest/save-all-images-webextension/latest.xpi";
          #  installation_mode = "force_installed";
          #};
          # MainWP Browser Extension - Stay informed by monitoring available updates and non-MainWP changes to your WordPress sites:
          #"support@mainwp.com" = {
          #  install_url = "https://addons.mozilla.org/firefox/downloads/latest/mainwp-browser-extension/latest.xpi";
          #  installation_mode = "force_installed";
          #};
          # MarkDownload - Markdown Web Clipper:
          #"{1c5e4c6f-5530-49a3-b216-31ce7d744db0}" = {
          #  install_url = "https://addons.mozilla.org/firefox/downloads/latest/markdownload/latest.xpi";
          #  installation_mode = "force_installed";
          #};
          # Obsidian Clipper:
          #"{89de3545-7b8f-4005-b87c-3ed3d79850a2}" = {
          #  install_url = "https://addons.mozilla.org/firefox/downloads/latest/obsidian-web-clipper/latest.xpi";
          #  installation_mode = "force_installed";
          #};
          # Joplin Web Clipper:
          #"{8419486a-54e9-11e8-9401-ac9e17909436}" = {
          #  install_url = "https://addons.mozilla.org/firefox/downloads/latest/joplin-web-clipper/latest.xpi";
          #  installation_mode = "force_installed";
          #};
          # Persepolis Download Manager Integration:
          #"com.persepolis.pdmchromewrapper@persepolisdm.github.io" = {
          #  install_url = "https://addons.mozilla.org/firefox/downloads/latest/persepolis-dlm-integration/latest.xpi";
          #  installation_mode = "force_installed";
          #};
          # uGet Integration:
          #"uget-integration@slgobinath" = {
          #  install_url = "https://addons.mozilla.org/firefox/downloads/latest/ugetintegration/latest.xpi";
          #  installation_mode = "force_installed";
          #};
          # Take Webpage Screenshots Entirely - FireShot:
          #"{0b457cAA-602d-484a-8fe7-c1d894a011ba}" = {
          #  install_url = "https://addons.mozilla.org/firefox/downloads/latest/fireshot/latest.xpi";
          #  installation_mode = "force_installed";
          #};
          # Nimbus Screen Capture - Screenshots, Annotate:
          #"nimbusscreencaptureff@everhelper.me" = {
          #  install_url = "https://addons.mozilla.org/firefox/downloads/latest/nimbus-screenshot/latest.xpi";
          #  installation_mode = "force_installed";
          #};

          /* ---- PREFERENCES ---- */
        # Check about:config for options.
        # Add home page
        Preferences = { 
          "browser.contentblocking.category" = { Value = "strict"; Status = "locked"; };
          "extensions.pocket.enabled" = lock-false;
          "extensions.screenshots.disabled" = lock-true;
          "browser.topsites.contile.enabled" = lock-false;
          "browser.formfill.enable" = lock-false;
          "browser.search.suggest.enabled" = lock-false;
          "browser.search.suggest.enabled.private" = lock-false;
          "browser.urlbar.suggest.searches" = lock-false;
          "browser.urlbar.showSearchSuggestionsFirst" = lock-false;
          "browser.newtabpage.activity-stream.feeds.section.topstories" = lock-false;
          "browser.newtabpage.activity-stream.feeds.snippets" = lock-false;
          "browser.newtabpage.activity-stream.section.highlights.includePocket" = lock-false;
          "browser.newtabpage.activity-stream.section.highlights.includeBookmarks" = lock-false;
          "browser.newtabpage.activity-stream.section.highlights.includeDownloads" = lock-false;
          "browser.newtabpage.activity-stream.section.highlights.includeVisited" = lock-false;
          "browser.newtabpage.activity-stream.showSponsored" = lock-false;
          "browser.newtabpage.activity-stream.system.showSponsored" = lock-false;
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = lock-false;
        };
      };
    };
  };
};
}
