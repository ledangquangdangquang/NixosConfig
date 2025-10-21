{ user, pkgs, ... }: # Giả định file có nhận các biến user, pkgs, v.v.

{
  programs.zsh = {
    enable = true;
    # enableCompletions = true; # Đang bị comment, giữ nguyên
    syntaxHighlighting.enable = true;
    
    initContent = ''
      export EDITOR=nvim

      # =========================================================
      # Sửa lại function y() cho Yazi: cd vào thư mục đã chọn
      # =========================================================
      function y() {
        local tmp_file=$(mktemp -t "yazi-cwd.XXXXXX")
        # Đảm bảo file tạm được xóa khi hàm kết thúc (kể cả khi yazi crash)
        trap "rm -f $tmp_file" EXIT
        
        yazi "$@" --cwd-file="$tmp_file"
        
        # Đọc nội dung từ file tạm
        local cwd=$(<"$tmp_file")
        
        # Đổi thư mục nếu $cwd hợp lệ và khác thư mục hiện tại
        if [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
          builtin cd -- "$cwd"
        fi
      }

      # =========================================================
      # function fuzzyvim
      # =========================================================
      fuzzyvim() {
        local file
        file=$(find . -type f \
          | fzf --layout=reverse \
                --height=80% \
                --preview 'bat --style=numbers --color=always {}' \
                --preview-window=right:60%) || return
        nvim "$file"
      }

      # =========================================================
      # Tự động attach/tạo session Tmux
      # =========================================================
      if command -v tmux >/dev/null 2>&1; then
        if [[ -z "$TMUX" ]] && [[ -n "$PS1" ]]; then
          tmux attach-session -t default || tmux new-session -s default
        fi
      fi
    '';

    zplug = {
      enable = true;
      plugins = [
        {name = "zsh-users/zsh-autosuggestions";}
      ];
    };

    shellAliases = {
      # Đảm bảo sử dụng ${user} đúng cách trong Nix string
      home-rebuild-vm = "home-manager switch --flake ./#${user}@nixos-vm";
      home-rebuild = "home-manager switch --flake ./#${user}@nixos";
      nixos-rebuild = "sudo nixos-rebuild switch --flake ./#nixos";
      nixos-rebuild-vm = "sudo nixos-rebuild switch --flake ./#nixos-vm";
    };
    
    history.size = 10000;
  };
}
# {user, ...}:{
#   programs.zsh = {
#     enable = true;
#     # enableCompletions = true;
#     syntaxHighlighting.enable = true;
#     initContent = ''
#       export EDITOR=nvim
#         function y() {
#     local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
#     yazi "$@" --cwd-file="$tmp"
#     IFS= read -r -d '' cwd < "$tmp"
#     [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
#     rm -f -- "$tmp"
#   }
#       fuzzyvim() {
#         local file
#         file=$(find . -type f \
#           | fzf --layout=reverse \
#                 --height=80% \
#                 --preview 'bat --style=numbers --color=always {}' \
#                 --preview-window=right:60%) || return
#         nvim "$file"
#       }
#       if command -v tmux >/dev/null 2>&1; then
#         if [[ -z "$TMUX" ]] && [[ -n "$PS1" ]]; then
#           tmux attach-session -t default || tmux new-session -s default
#         fi
#       fi
#
#     '';
#     zplug = {
#       enable = true;
#       plugins = [
#         {name = "zsh-users/zsh-autosuggestions";}
#       ];
#     };
#     shellAliases = {
#       home-rebuild-vm = "home-manager switch --flake ./#${user}@nixos-vm";
#       home-rebuild = "home-manager switch --flake ./#${user}@nixos ";
#       nixos-rebuild = "sudo nixos-rebuild switch --flake ./#nixos";
#       nixos-rebuild-vm = "sudo nixos-rebuild switch --flake ./#nixos-vm";
#     };
#     history.size = 10000;
#   };
# }
