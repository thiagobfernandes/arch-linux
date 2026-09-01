-- ~/.config/hypr/hyprland.lua
-- Config base "maneira" para Arch + Hyprland

-- ======================
-- Geral
-- ======================
hl.general {
  gaps_in = 5,
  gaps_out = 10,
  border_size = 2,
  ["col.active_border"] = "rgb(87cf69)",
  ["col.inactive_border"] = "rgb(334155)",
  layout = "dwindle",
}

-- ======================
-- Decoração
-- ======================
hl.decoration {
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
}

-- ======================
-- Animações
-- ======================
hl.animations {
  enabled = true,
  bezier = "myBezier, 0.05, 0.9, 0.1, 1.05",
  animation = {
    "windows, 1, 7, myBezier",
    "windowsOut, 1, 7, default, popin 80%",
    "fade, 1, 7, default",
    "workspaces, 1, 6, default",
  },
}

-- ======================
-- Layout dwindle
-- ======================
hl.dwindle {
  pseudotile = true,
  preserve_split = true,
}

-- ======================
-- Input
-- ======================
hl.input {
  kb_layout = "us",
  follow_mouse = 1,
  touchpad = {
    natural_scroll = true,
  },
}

-- ======================
-- Variáveis
-- ======================
local mainMod = "SUPER"

-- ======================
-- Atalhos básicos
-- ======================

-- Terminal
hl.bind(mainMod, "Return", "exec", "kitty")

-- Fechar janela ativa
hl.bind(mainMod, "q", "killactive", "")

-- Recarregar config
hl.bind(mainMod, "r", "exec", "hyprctl reload")

-- Launcher (wofi)
hl.bind(mainMod, "space", "exec", "wofi --show drun")

-- Lock screen
hl.bind(mainMod, "l", "exec", "hyprlock")

-- Screenshot de região
hl.bind(mainMod, "p", "exec", "grim -g \"$(slurp)\" - | wl-copy")

-- ======================
-- Workspaces (1–9)
-- ======================
for i = 1, 9 do
  hl.bind(mainMod, tostring(i), "workspace", tostring(i))
  hl.bind(mainMod .. ", SHIFT", tostring(i), "movetoworkspace", tostring(i))
end

-- ======================
-- Mover foco (vim-like)
-- ======================
hl.bind(mainMod, "h", "movefocus", "l")
hl.bind(mainMod, "j", "movefocus", "d")
hl.bind(mainMod, "k", "movefocus", "u")
hl.bind(mainMod, "l", "movefocus", "r")

-- ======================
-- Mover janela ativa
-- ======================
hl.bind(mainMod .. ", SHIFT", "h", "movewindow", "l")
hl.bind(mainMod .. ", SHIFT", "j", "movewindow", "d")
hl.bind(mainMod .. ", SHIFT", "k", "movewindow", "u")
hl.bind(mainMod .. ", SHIFT", "l", "movewindow", "r")

-- ======================
-- Volume (PulseAudio/PipeWire)
-- ======================
hl.bind("", "XF86AudioRaiseVolume", "exec", "pactl set-sink-volume @DEFAULT_SINK@ +5%")
hl.bind("", "XF86AudioLowerVolume", "exec", "pactl set-sink-volume @DEFAULT_SINK@ -5%")
hl.bind("", "XF86AudioMute", "exec", "pactl set-sink-mute @DEFAULT_SINK@ toggle")

-- ======================
-- Brilho de tela
-- ======================
hl.bind("", "XF86MonBrightnessUp", "exec", "brightnessctl set +5%")
hl.bind("", "XF86MonBrightnessDown", "exec", "brightnessctl set 5%-")

-- ======================
-- Apps ao iniciar (exec-once)
-- ======================

-- Authentication agent (polkit)
hl.exec_once("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")

-- Barra (Waybar)
hl.exec_once("waybar")

-- Notificações (SwayNC)
hl.exec_once("swaync")

-- XDG Desktop Portal
hl.exec_once("/usr/lib/xdg-desktop-portal-hyprland")

-- Papel de parede (Hyprpaper)
hl.exec_once("hyprpaper")

-- ======================
-- Espaço para suas customizações
-- ======================

-- Exemplo: adicionar Chrome/Chromium
-- hl.bind(mainMod, "c", "exec", "google-chrome-stable")
-- ou:
-- hl.bind(mainMod, "c", "exec", "chromium")

-- Exemplo: abrir file manager (Thunar)
-- hl.bind(mainMod, "e", "exec", "thunar")

-- Você pode adicionar mais binds, exec_once, regras de janela, etc. aqui.
