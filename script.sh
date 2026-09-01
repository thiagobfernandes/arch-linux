-- ~/.config/hypr/hyprland.lua
-- Config base "maneira" para Arch + Hyprland (sintaxe corrigida)

return {
  general = {
    gaps_in = 5,
    gaps_out = 10,
    border_size = 2,
    ["col.active_border"] = "rgb(87cf69)",
    ["col.inactive_border"] = "rgb(334155)",
    layout = "dwindle",
  },

  decoration = {
    rounding = 10,
    blur = {
      enabled = true,
      size = 3,
      passes = 1,
    },
    shadow = {
      enabled = true,
      range = 4,
      render_power = 3,
    },
  },

  animations = {
    enabled = true,
    bezier = "myBezier, 0.05, 0.9, 0.1, 1.05",
    animation = {
      "windows, 1, 7, myBezier",
      "windowsOut, 1, 7, default, popin 80%",
      "fade, 1, 7, default",
      "workspaces, 1, 6, default",
    },
  },

  dwindle = {
    pseudotile = true,
    preserve_split = true,
  },

  input = {
    kb_layout = "us",
    follow_mouse = 1,
    touchpad = {
      natural_scroll = true,
    },
  },

  bind = {
    -- Modificador
    "SUPER, Return, exec, kitty",
    "SUPER, Q, killactive",
    "SUPER, R, exec, hyprctl reload",
    "SUPER, space, exec, wofi --show drun",
    "SUPER, L, exec, hyprlock",
    "SUPER, P, exec, grim -g \"$(slurp)\" - | wl-copy",

    -- Workspaces
    "SUPER, 1, workspace, 1",
    "SUPER, 2, workspace, 2",
    "SUPER, 3, workspace, 3",
    "SUPER, 4, workspace, 4",
    "SUPER, 5, workspace, 5",
    "SUPER, 6, workspace, 6",
    "SUPER, 7, workspace, 7",
    "SUPER, 8, workspace, 8",
    "SUPER, 9, workspace, 9",

    "SUPER SHIFT, 1, movetoworkspace, 1",
    "SUPER SHIFT, 2, movetoworkspace, 2",
    "SUPER SHIFT, 3, movetoworkspace, 3",
    "SUPER SHIFT, 4, movetoworkspace, 4",
    "SUPER SHIFT, 5, movetoworkspace, 5",
    "SUPER SHIFT, 6, movetoworkspace, 6",
    "SUPER SHIFT, 7, movetoworkspace, 7",
    "SUPER SHIFT, 8, movetoworkspace, 8",
    "SUPER SHIFT, 9, movetoworkspace, 9",

    -- Mover foco (vim-like)
    "SUPER, h, movefocus, l",
    "SUPER, j, movefocus, d",
    "SUPER, k, movefocus, u",
    "SUPER, l, movefocus, r",

    -- Mover janela
    "SUPER SHIFT, h, movewindow, l",
    "SUPER SHIFT, j, movewindow, d",
    "SUPER SHIFT, k, movewindow, u",
    "SUPER SHIFT, l, movewindow, r",

    -- Volume
    ", XF86AudioRaiseVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ +5%",
    ", XF86AudioLowerVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ -5%",
    ", XF86AudioMute, exec, pactl set-sink-mute @DEFAULT_SINK@ toggle",

    -- Brilho
    ", XF86MonBrightnessUp, exec, brightnessctl set +5%",
    ", XF86MonBrightnessDown, exec, brightnessctl set 5%-",
  },

  exec_once = {
    "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1",
    "waybar",
    "swaync",
    "/usr/lib/xdg-desktop-portal-hyprland",
    "hyprpaper",
  },
}
