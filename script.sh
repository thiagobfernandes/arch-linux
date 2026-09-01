# ~/.config/hypr/hyprland.conf
# Config base para Arch + Hyprland (de acordo com o script que você rodou)

# ======================
# Variáveis e geral
# ======================

# Tecla modificadora (SUPER = tecla Windows)
$modifier = SUPER

# Layout padrão
general {
    gaps_in = 5
    gaps_out = 10
    border_size = 2
    col.active_border = rgb(87cf69)
    col.inactive_border = rgb(334155)
    layout = dwindle
}

# Decoração
decoration {
    rounding = 10

    blur {
        enabled = true
        size = 3
        passes = 1
    }

    shadow {
        enabled = true
        range = 4
        render_power = 3
    }
}

# Animações
animations {
    enabled = true

    bezier = myBezier, 0.05, 0.9, 0.1, 1.05

    animation = windows, 1, 7, myBezier
    animation = windowsOut, 1, 7, default, popin 80%
    animation = fade, 1, 7, default
    animation = workspaces, 1, 6, default
}

# Layout dwindle
dwindle {
    pseudotile = true
    preserve_split = true
}

# Input (teclado/trackpad)
input {
    kb_layout = us
    follow_mouse = 1

    touchpad {
        natural_scroll = true
    }
}

# ======================
# Atalhos básicos
# ======================

# Terminal
bind = $modifier, Return, exec, kitty

# Fechar janela ativa
bind = $modifier, Q, killactive

# Recarregar config
bind = $modifier, R, exec, hyprctl reload

# Launcher (wofi)
bind = $modifier, space, exec, wofi --show drun

# Lock screen
bind = $modifier, L, exec, hyprlock

# Screenshot de região (grim + slurp + wl-copy)
bind = $modifier, P, exec, grim -g "$(slurp)" - | wl-copy

# Workspaces (1–9)
bind = $modifier, 1, workspace, 1
bind = $modifier, 2, workspace, 2
bind = $modifier, 3, workspace, 3
bind = $modifier, 4, workspace, 4
bind = $modifier, 5, workspace, 5
bind = $modifier, 6, workspace, 6
bind = $modifier, 7, workspace, 7
bind = $modifier, 8, workspace, 8
bind = $modifier, 9, workspace, 9

# Mover janela pra workspace
bind = $modifier SHIFT, 1, movetoworkspace, 1
bind = $modifier SHIFT, 2, movetoworkspace, 2
bind = $modifier SHIFT, 3, movetoworkspace, 3
bind = $modifier SHIFT, 4, movetoworkspace, 4
bind = $modifier SHIFT, 5, movetoworkspace, 5
bind = $modifier SHIFT, 6, movetoworkspace, 6
bind = $modifier SHIFT, 7, movetoworkspace, 7
bind = $modifier SHIFT, 8, movetoworkspace, 8
bind = $modifier SHIFT, 9, movetoworkspace, 9

# Mover foco (vim-like)
bind = $modifier, h, movefocus, l
bind = $modifier, j, movefocus, d
bind = $modifier, k, movefocus, u
bind = $modifier, l, movefocus, r

# Mover janela ativa
bind = $modifier SHIFT, h, movewindow, l
bind = $modifier SHIFT, j, movewindow, d
bind = $modifier SHIFT, k, movewindow, u
bind = $modifier SHIFT, l, movewindow, r

# Volume (PulseAudio/PipeWire)
bind = , XF86AudioRaiseVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ +5%
bind = , XF86AudioLowerVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ -5%
bind = , XF86AudioMute, exec, pactl set-sink-mute @DEFAULT_SINK@ toggle

# Brilho de tela
bind = , XF86MonBrightnessUp, exec, brightnessctl set +5%
bind = , XF86MonBrightnessDown, exec, brightnessctl set 5%-

# ======================
# Apps ao iniciar (exec-once)
# ======================

# Authentication agent (polkit)
exec-once = /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1

# Barra (Waybar)
exec-once = waybar

# Notificações (SwayNC)
exec-once = swaync

# XDG Desktop Portal (importante para apps modernos)
exec-once = /usr/lib/xdg-desktop-portal-hyprland

# Papel de parede (Hyprpaper)
exec-once = hyprpaper

# ======================
# Espaço para suas customizações
# ======================

# Exemplo: adicionar Chrome/Chromium depois:
# bind = $modifier, C, exec, google-chrome-stable
# ou:
# bind = $modifier, C, exec, chromium

# Exemplo: abrir file manager (Thunar):
# bind = $modifier, E, exec, thunar

# Você pode adicionar mais binds, exec-once, regras de janela, etc. aqui.
