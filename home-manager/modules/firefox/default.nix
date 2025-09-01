{
  config,
  pkgs,
  firefox-addons,
  inputs,
  ...
}: {
  catppuccin.firefox.enable = true;

  programs.firefox = {
    enable = true;
    package =
      if pkgs.stdenv.isDarwin
      then pkgs.firefox-bin
      else pkgs.firefox-wayland;
    nativeMessagingHosts = with pkgs; [ff2mpv-rust];
    policies = {
      # about:support
      ExtensionSettings = {
        # Ublock origin
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
        };
        # Authenticator
        "authenticator@mymindstorm" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/file/4353166/auth_helper-8.0.2.xpi";
          installation_mode = "force_installed";
        };
        # Bitwarden
        "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/file/4562769/bitwarden_password_manager-2025.8.1.xpi";
          installation_mode = "force_installed";
        };
        # Stylus
        "{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/file/4554444/styl_us-2.3.16.xpi";
          installation_mode = "force_installed";
        };
        # Tampermonkey
        "firefox@tampermonkey.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/file/4405733/tampermonkey-5.3.3.xpi";
          installation_mode = "force_installed";
        };
        # Vimium
        "{d7742d87-e61d-4b78-b8a1-b469842139fa}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/file/4524018/vimium_ff-2.3.xpi";
          installation_mode = "force_installed";
        };
      };
    };
    profiles.default = {
      extensions.force = true; # override extension
      bookmarks.force = true; # override bookmark
      userChrome = ./FirefoxCss/chrome/userChrome.css;
      settings = {
        "devtools.chrome.enabled" = true;
        "devtools.debugger.remote-enabled" = true;
        "devtools.debugger.prompt-connection" = false;
        "layout.spellcheckDefault" = 0;
        "accessibility.force_disabled" = 1;
        "app.normandy.api_url" = "";
        "app.normandy.enabled" = false;
        "app.shield.optoutstudies.enabled" = false;
        "apz.gtk.kinetic_scroll.enabled" = false;
        "apz.overscroll.enabled" = false;
        "browser.aboutConfig.showWarning" = false;
        "browser.contentblocking.category" = "strict";
        "browser.ctrlTab.recentlyUsedOrder" = false;
        "browser.discovery.enabled" = false;
        "browser.download.alwaysOpenPanel" = false;
        "browser.formfill.enable" = false;
        "browser.gesture.swipe.left" = "";
        "browser.gesture.swipe.right" = "";
        "browser.newtabpage.activity-stream.feeds.discoverystreamfeed" = false;
        "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
        "browser.newtabpage.activity-stream.feeds.snippets" = false;
        "browser.newtabpage.activity-stream.feeds.telemetry" = false;
        "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.newtabpage.activity-stream.telemetry" = false;
        "browser.newtabpage.enabled" = false;
        "browser.ping-centre.telemetry" = false;
        "browser.privatebrowsing.forceMediaMemoryCache" = true;
        "browser.safebrowsing.downloads.remote.enabled" = false;
        "browser.safebrowsing.downloads.remote.url" = "";
        "browser.search.suggest.enabled" = false;
        "browser.sessionstore.warnOnQuit" = true;
        "browser.shell.checkDefaultBrowser" = false;
        "browser.startup.homepage" = "about:home";
        "browser.startup.homepage_override.mstone" = "ignore";
        "browser.startup.page" = 1;
        "browser.tabs.inTitlebar" = 0;
        "browser.tabs.warnOnClose" = false;
        "browser.theme.dark-private-windows" = true;
        "browser.toolbars.bookmarks.visibility" = false;
        "browser.urlbar.trimURLs" = false;
        "browser.xul.error_pages.expert_bad_cert" = true;
        "cookiebanners.ui.desktop.enabled" = true;
        "datareporting.healthreport.uploadEnabled" = false;
        "datareporting.policy.dataSubmissionEnabled" = false;
        "devtools.theme" = "auto";
        "devtools.toolbox.host" = "bottom";
        "dom.disable_window_move_resize" = true;
        "dom.forms.autocomplete.formautofill" = false;
        "dom.payments.defaults.saveAddress" = false;
        "dom.security.https_only_mode" = true;
        "dom.storage.next_gen" = true;
        "extensions.formautofill.addresses.enabled" = false;
        "extensions.formautofill.available" = "off";
        "extensions.formautofill.creditCards.available" = false;
        "extensions.formautofill.creditCards.enabled" = false;
        "extensions.formautofill.heuristics.enabled" = false;
        "extensions.getAddons.showPane" = false;
        "extensions.htmlaboutaddons.recommendations.enabled" = false;
        "extensions.pocket.enabled" = false;
        "general.smoothScroll" = false;
        "gfx.webrender.all" = true;
        "layout.css.visited_links_enabled" = false;
        "media.memory_cache_max_size" = 65536;
        "network.auth.subresource-http-auth-allow" = 1;
        "network.gio.supported-protocols" = "";
        "network.http.referer.XOriginPolicy" = 2;
        "network.http.referer.XOriginTrimmingPolicy" = 2;
        "network.protocol-handler.external.mailto" = false;
        "network.proxy.socks_remote_dns" = true;
        "permissions.delegation.enabled" = false;
        "privacy.clearOnShutdown.cache" = true;
        "privacy.clearOnShutdown.cookies" = false;
        "privacy.clearOnShutdown.downloads" = true;
        "privacy.clearOnShutdown.formdata" = true;
        "privacy.clearOnShutdown.history" = false;
        "privacy.clearOnShutdown.sessions" = false;
        "privacy.partition.always_partition_third_party_non_cookie_storage.exempt_sessionstorage" = false;
        "privacy.partition.always_partition_third_party_non_cookie_storage" = true;
        "privacy.sanitize.sanitizeOnShutdown" = true;
        "privacy.trackingprotection.enabled" = true;
        "privacy.userContext.enabled" = true;
        "privacy.userContext.ui.enabled" = true;
        "privacy.window.name.update.enabled" = true;
        "security.cert_pinning.enforcement_level" = 2;
        "security.mixed_content.block_display_content" = true;
        "security.OCSP.require" = true;
        "security.pki.crlite_mode" = 2;
        "security.remote_settings.crlite_filters.enabled" = true;
        "security.ssl.require_safe_negotiation" = true;
        "services.sync.engine.addons" = false;
        "services.sync.engine.creditcards" = false;
        "services.sync.engine.passwords" = false;
        "sidebar.verticalTabs" = false;
        "signon.autofillForms" = false;
        "signon.formlessCapture.enabled" = false;
        "signon.rememberSignons" = false;
        "toolkit.coverage.endpoint.base" = "";
        "toolkit.coverage.opt-out" = true;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "toolkit.scrollbox.smoothScroll" = false;
        "toolkit.telemetry.archive.enabled" = false;
        "toolkit.telemetry.bhrPing.enabled" = false;
        "toolkit.telemetry.coverage.opt-out" = true;
        "toolkit.telemetry.enabled" = false;
        "toolkit.telemetry.firstShutdownPing.enabled" = false;
        "toolkit.telemetry.newProfilePing.enabled" = false;
        "toolkit.telemetry.server" = "data:,";
        "toolkit.telemetry.shutdownPingSender.enabled" = false;
        "toolkit.telemetry.unified" = false;
        "toolkit.telemetry.updatePing.enabled" = false;
        "widget.non-native-theme.enabled" = true;
      };

      bookmarks.settings = [
        # Bookmarks Toolbar / HUST
        {
          name = "qldt new ver";
          url = "https://student.hust.edu.vn/learn/timetable";
        }
        {
          name = "CTT ĐHBKHN";
          url = "https://ctt.hust.edu.vn/Services";
        }
        {
          name = "CTT-SIS";
          url = "https://ctt-sis.hust.edu.vn/Students/StudentCheckInputGradeTerm.aspx";
        }
        {
          name = "Soạn thời khóa biểu HUST";
          url = "https://hungitb.github.io/tkb-hust/";
        }
        {
          name = "Sự kiện - HUST";
          url = "https://ctsv.hust.edu.vn/#/danh-sach-su-kien";
        }
        {
          name = "Lấy token ictsv";
          url = "javascript:/TokenCode=([%5E;]+);/.exec(document.cookie)[1]";
        }
        {
          name = "lấy mã lớp hieupham2k1";
          url = "javascript: (function () { const elements = document.querySelectorAll('b.el-tooltip'); const classIds = Array.from(elements).map(el => el.textContent.trim()); const uniqueValues = [...new Set(classIds)]; var text = uniqueValues.join(','); var textArea = document.createElement(%22textarea%22); textArea.value = text; document.body.appendChild(textArea); textArea.select(); try { document.execCommand('copy'); document.body.removeChild(textArea); alert(%22Text copied to clipboard: %22 + text); } catch (err) { alert(%22Error copying text: %22 + err); } })();";
        }
        {
          name = "lấy mã lớp hungitb";
          url = "javascript: (function () {const elements = document.querySelectorAll('.h53');const values = Array.from(elements).map(element => Array.from(element.childNodes) .filter(node => node.nodeType === Node.TEXT_NODE) .map(node => node.textContent.trim()) .join('') ); var text = values.join(','); var textArea = document.createElement(%22textarea%22); textArea.value = text; document.body.appendChild(textArea); textArea.select(); try { document.execCommand('copy'); document.body.removeChild(textArea); alert(%22Text copied to clipboard: %22 + text); } catch (err) { alert(%22Error copying text: %22 + err); } })();";
        }

        # Bookmarks Toolbar (Root)
        {
          name = "ejoy-english.com";
          url = "https://ejoy-english.com/go/pdf";
        }
        {
          name = "outlook.office365.com";
          url = "https://outlook.office365.com/mail/";
        }
        {
          name = "chat.zalo.me";
          url = "https://chat.zalo.me/";
        }
        {
          name = "translate.google.com";
          url = "https://translate.google.com/?hl=vi&sl=en&tl=vi&op=translate";
        }
        {
          name = "chatgpt.com";
          url = "https://chatgpt.com/";
        }
        {
          name = "chat.deepseek.com";
          url = "https://chat.deepseek.com/";
        }
        {
          name = "circuit2tikz.tf.fau.de";
          url = "https://circuit2tikz.tf.fau.de/designer/";
        }
        {
          name = "teams.microsoft.com";
          url = "https://teams.microsoft.com/v2/";
        }
        {
          name = "OnePiece Sheet";
          url = "https://docs.google.com/spreadsheets/d/1T1RO2vkPo4-ttNqyVHTdjo2uXiwuAcLwdRhQX6p5XOY/edit?gid=417259243#gid=417259243";
        }
        {
          name = "soundcloud.com";
          url = "https://soundcloud.com/discover";
        }
        {
          name = "shopee.vn";
          url = "https://shopee.vn/user/purchase";
        }
        {
          name = "trends.google.com.vn";
          url = "https://trends.google.com.vn/trending?geo=VN&hl=vi";
        }
        {
          name = "matlab.mathworks.com";
          url = "https://matlab.mathworks.com/";
        }
        {
          name = "overleaf.com";
          url = "https://www.overleaf.com/project";
        }
        {
          name = "repo github";
          url = "https://github.com/ledangquangdangquang?tab=repositories";
        }
        {
          name = "notebooklm.google.com";
          url = "https://notebooklm.google.com/?_gl=1*1a7bxbp*_ga*NzQ2NDkxMDIzLjE3MzM0MDc3MjY.*_ga_W0LDH41ZCB*MTczMzQwNzcyNS4xLjAuMTczMzQwNzcyNS42MC4wLjA.&original_referer=https:%2F%2Fnotebooklm.google%23&original_referer=https:%2F%2Fnotebooklm.google%23&original_referer=https:%2F%2Faccounts.google.com%23&pli=1&authuser=1";
        }
        {
          name = "speedtest.net";
          url = "https://www.speedtest.net/";
        }
        {
          name = "scoop.sh";
          url = "https://scoop.sh/";
        }
        {
          name = "messenger.com";
          url = "https://www.messenger.com/e2ee/t/7118364721553220/?locale=vi_VN";
        }
        {
          name = "onedrive";
          url = "https://husteduvn-my.sharepoint.com/my?login_hint=Quang%2ELD224113%40sis%2Ehust%2Eedu%2Evn";
        }
        {
          name = "Tạo nhịp tim";
          url = "javascript:(function()%7Blet%20sampleIndex%20%3D%200%3B%0Aconst%20maxSamples%20%3D%2030%3B%0A%0Aconst%20specialBPMIndices%20%3D%20new%20Set()%3B%0Awhile%20(specialBPMIndices.size%20%3C%202)%20%7B%0A%20%20specialBPMIndices.add(Math.floor(Math.random()%20*%20maxSamples))%3B%0A%7D%0A%0Afunction%20generateSample()%20%7B%0A%20%20const%20IR%20%3D%20Math.floor(127000%20%2B%20Math.random()%20*%201500)%3B%0A%0A%20%20const%20BPM%20%3D%20specialBPMIndices.has(sampleIndex)%0A%20%20%20%20%3F%20'200.00'%0A%20%20%20%20%3A%20(60%20%2B%20Math.random()%20*%2040).toFixed(2)%3B%0A%0A%20%20return%20%60IR%3D%24%7BIR%7D%20BPM%3D%24%7BBPM%7D%60%3B%0A%7D%0A%0Aconst%20intervalId%20%3D%20setInterval(()%20%3D%3E%20%7B%0A%20%20if%20(sampleIndex%20%3E%3D%20maxSamples)%20%7B%0A%20%20%20%20clearInterval(intervalId)%3B%0A%20%20%20%20return%3B%0A%20%20%7D%0A%0A%20%20const%20line%20%3D%20generateSample()%3B%0A%20%20output.textContent%20%2B%3D%20line%20%2B%20'%5Cn'%3B%0A%20%20sampleIndex%2B%2B%3B%0A%7D%2C%20200)%3B%7D)()%3B";
        }
        {
          name = "diffchecker.com";
          url = "https://www.diffchecker.com/?fbclid=IwY2xjawHLK1NleHRuA2FlbQIxMAABHXjD1Zn785cbNoVwne4u8K4Ee8Cjrf0Ehp2d84mgooqTYvxemA9MMo0lvg_aem_eG3WSp9FrQW4Z0RYpJ4wyQ";
        }
        {
          name = "MATLAB Course";
          url = "https://matlabacademy.mathworks.com/v1/portal.html?course=gettingstarted#chapter=1&lesson=1";
        }
        {
          name = "up image";
          url = "https://imgur.com/a/8YldJqO?third_party=1";
        }
        {
          name = "TOC-GPT";
          url = "javascript:(function(){%22use strict%22;if(document.getElementById(%22toc-panel%22)||document.getElementById(%22toc-handle%22))return;var e=document.createElement(%22style%22);e.textContent=%22#toc-panel{position:fixed;top:0;right:0;width:280px;height:100%;background:#fafafa;box-shadow:-4px%200%208px%20rgba(0,0,0,.1);font-family:sans-serif;font-size:.8rem;border-left:1px%20solid%20#ddd;display:flex;flex-direction:column;z-index:9998;transform:translateX(0);transition:transform%20.3s%20ease}#toc-panel.collapsed{transform:translateX(280px)}#toc-header{padding:6px%2010px;background:#ddd;border-bottom:1px%20solid%20#ccc;font-weight:bold;flex-shrink:0}#toc-list{list-style:none;flex:1;overflow-y:auto;margin:0;padding:6px}#toc-list%20li{padding:4px;cursor:pointer;border-radius:3px;transition:background-color%20.2s}#toc-list%20li:hover{background:#f0f0f0}#toc-list%20ul{margin-left:16px;padding:0}#toc-list%20ul%20li::before{content:\%22\%22}#toc-handle{position:fixed;top:50%;right:0;transform:translateY(-50%);width:30px;height:80px;background:#ccc;display:flex;align-items:center;justify-content:center;writing-mode:vertical-rl;text-orientation:mixed;cursor:pointer;font-weight:bold;user-select:none;z-index:9999;transition:background%20.2s}#toc-handle:hover{background:#bbb}@keyframes%20highlightFade{0%{background-color:#fffa99}100%{background-color:transparent}}.toc-highlight{animation:highlightFade%201.5s%20forwards}@media%20(prefers-color-scheme:dark){#toc-panel{background:#333;border-left:1px%20solid%20#555;box-shadow:-4px%200%208px%20rgba(0,0,0,.7)}#toc-header{background:#555;border-bottom:1px%20solid%20#666;color:#eee}#toc-list%20li:hover{background:#444}#toc-list{color:#eee}#toc-handle{background:#555;color:#ddd}#toc-handle:hover{background:#666}}%22,document.head.appendChild(e);var%20t=document.createElement(%22div%22);t.id=%22toc-panel%22,t.innerHTML='%3Cdiv%20id=%22toc-header%22%3EConversation%20TOC%3C/div%3E%3Cul%20id=%22toc-list%22%3E%3C/ul%3E',document.body.appendChild(t);var%20n=document.createElement(%22div%22);n.id=%22toc-handle%22,n.textContent=%22TOC%22,document.body.appendChild(n);var%20r=null,o=null,i=false,a=null;function%20c(){if(i)return;i=true;a=setTimeout(function(){l(),i=false},300)}function%20l(){var%20s=document.getElementById(%22toc-list%22);if(!s)return;s.innerHTML=%22%22;var%20d=(r||document).querySelectorAll(%22article[data-testid^='conversation-turn-']%22);if(!d||d.length===0){s.innerHTML='%3Cli%20style=%22opacity:0.7;font-style:italic;%22%3EEmpty%20chat%3C/li%3E';return}for(var%20u=0;u%3Cd.length;u++){var%20g=d[u],m=document.createElement(%22li%22),h=g.querySelector(%22h6.sr-only%22),f=false;if(h&&h.textContent.indexOf(%22ChatGPT%20said:%22)%3E=0){f=true,m.textContent=%22Turn%20%22+(u+1)+%22%20(AI)%22}else{m.textContent=%22Turn%20%22+(u+1)+%22%20(You)%22}(function(E){m.addEventListener(%22click%22,function(){E.scrollIntoView({behavior:%22smooth%22,block:%22start%22})})})(g);if(f){var%20v=document.createElement(%22ul%22),p=g.querySelectorAll(%22h3:not(.sr-only)%22);for(var%20L=0;L%3Cp.length;L++){var%20x=p[L],y=false,w=x;while(w){if(w.tagName===%22PRE%22||w.tagName===%22CODE%22){y=true;break}w=w.parentElement}if(y)continue;var%20b=document.createElement(%22li%22),H=(x.textContent||%22%22).trim()||%22Section%20%22+(L+1);b.textContent=H;(function(M){b.addEventListener(%22click%22,function(A){A.stopPropagation(),M.classList.remove(%22toc-highlight%22),M.offsetWidth,M.classList.add(%22toc-highlight%22),M.scrollIntoView({behavior:%22smooth%22,block:%22start%22})})})(x),v.appendChild(b)}v.children.length%3E0&&m.appendChild(v)}s.appendChild(m)}}function%20y(){var%20e=document.querySelector(%22main#main%22)||document.querySelector(%22.chat-container%22)||null;if(e!==r){r=e,o&&(o.disconnect(),o=null),r&&(o=new%20MutationObserver(function(){c()}),o.observe(r,{childList:true,subtree:true}),l())}}y();var%20I=setInterval(y,2e3);n.addEventListener(%22click%22,function(){t.classList.toggle(%22collapsed%22)});})();";
        }
        {
          name = "Ẩn fb";
          url = "javascript:(function() {    var className = 'x9f619 x1ja2u2z x78zum5 x1n2onr6 x1iyjqo2 xs83m0k xeuugli xl56j7k x1qjc9v5 xozqiw3 x1q0g3np x1iplk16 x1xfsgkm xqmdsaz x1mtsufr x1w9j1nh';    var elements = document.getElementsByClassName(className);    for (var i = 0; i < elements.length; i++) {        elements[i].style.display = 'none';    }})();";
        }
        {
          name = "dịch việt sang anh";
          url = "https://app.ludwig.guru/s/t%C3%B4i+mu%E1%BB%91n+y%C3%AAu+ch%C3%ADnh+b%E1%BA%A3n+th%C3%A2n+m%C3%ACnh+h%C6%A1n";
        }
        {
          name = "CK 2024.1 - Google Trang tính";
          url = "https://docs.google.com/spreadsheets/d/18xAXlm7RaicrQ0dAtjxB7a7_eBLKTfWoVrrZnQ2zhZ8/edit?fbclid=IwZXh0bgNhZW0CMTEAAR2tNQMjcMbt-2faMzF0bptrNlcH5c_ODxn-iWKCiw6Fcj7udgcji-Tz_LM_aem_abmN_fIg27s0aHJBF2PdJA&gid=1338906422#gid=1338906422";
        }
        {
          name = "dich";
          url = "https://vikitranslator.com/";
        }
        {
          name = "Trò chơi âm nhạc";
          url = "https://trochoiamnhac.live/?fbclid=IwY2xjawIRs6lleHRuA2FlbQIxMAABHc7Fiz3JyTVb5loanINOIhV9avDP-DCFfjqwynBF_-CdFwLppyjCW9XkIA_aem__BHEWv7QNomDNWfC2J-tww#";
        }
        {
          name = "Wallpapers Clan - Cool Wallpapers - Free App Icons - Cool PFPs";
          url = "https://wallpapers-clan.com/";
        }
        {
          name = "music.amazon.com";
          url = "https://music.amazon.com/";
        }
        {
          name = "Octave Online · Cloud IDE compatible with MATLAB";
          url = "https://octave-online.net/";
        }
        {
          name = "Flakes - NixOS Wiki";
          url = "https://wiki.nixos.org/wiki/Flakes#Introduction";
        }
        {
          name = "prompts.chat";
          url = "https://prompts.chat/";
        }
        {
          name = "Tiếng Ngáp buồn ngủ Phụ nữ, con gái";
          url = "https://tiengdong.com/tieng-ngap-buon-ngu-phu-nu-con-gai";
        }
        {
          name = "Pomodoro Timer — Do more in less time, stress-free";
          url = "https://app.pomodorotimer.online/";
        }

        # Other Bookmarks
        {
          name = "CircuitVerse - Assignment10";
          url = "https://circuitverse.org/users/312761/projects/assignment10-02859780-66cf-42fd-a3fe-5265ed29dff0";
        }
        {
          name = "texpage.com";
          url = "https://www.texpage.com/console";
        }
        {
          name = "chess.com";
          url = "https://www.chess.com/home";
        }
      ];
    };
  };
}
