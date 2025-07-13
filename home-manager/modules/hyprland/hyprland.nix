{
	wayland.windowManager.hyprland = {
		enable = true;
		settings = {
			"$mod" = "SUPER";
			# --- General ---
			general = {
				gaps_in = 5;
				gaps_out = 20;
				border_size = 2;
				"col.active_border" = "rgba(ff5555ff)";
				"col.inactive_border" = "rgba(333333ff)";
			};
			# --- Monitor ---
			monitor = [
				"DP-1, 1920x1080@100, 0x0, 1"
				"eDP-1, 1920x1080@165, 1920x0, 1"
			];
			# --- Start up ---
			exec-once = [
				"waybar"
			];
			# --- Key blinds ---
			bind =
			[
				"$mod, F, exec, firefox"
				"$mod, A, exec, alacritty"
				"$mod, Q, killactive"
				"$mod, M, exit"
				"$mod, SPACE, exec, wofi --show drun"
				"$mod, l, movefocus, r"
				"$mod, h, movefocus, l"
				"$mod, j, movefocus, d"
				"$mod, k, movefocus, u"
				
				"$mod SHIFT, l, movewindow, r"
				"$mod SHIFT, h, movewindow, l"
				"$mod SHIFT, j, movewindow, d"
				"$mod SHIFT, k, movewindow, u"


				"$mod SHIFT, LEFT, resizeactive, -20 0"
				"$mod SHIFT, RIGHT, resizeactive, 20 0"
				"$mod SHIFT, DOWN, resizeactive, 0 20"
				"$mod SHIFT, UP, resizeactive, 0 -20"
			]
			++ (
				builtins.concatLists (builtins.genList (i:
					let
						ws = toString (i + 1);
						key = if i == 9 then "0" else ws;
					in [
						"$mod, ${key}, workspace, ${ws}"
						"$mod SHIFT, ${key}, movetoworkspace, ${ws}"
					]
				) 9)
			);
		};
	};
}
