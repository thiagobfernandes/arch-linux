#!/usr/bin/env bash
set -e

echo "=== Instalando pacotes básicos para Hyprland ==="

sudo pacman -Suy --noconfirm

sudo pacman -S --noconfirm \
  polkit-gnome \
  waybar \
  swaync \
  wl-clipboard \
  xdg-desktop-portal-hyprland \
  thunar thunar-volman \
  pipewire pipewire-alsa pipewire-pulse pipewire-jack wireplumber \
  pavucontrol \
  grim slurp \
  hyprlock \
  hypridle \
  hyprpaper

echo "=== Criando diretórios de configuração ==="

mkdir -p ~/.config/hypr
mkdir -p ~/.config/waybar
mkdir -p ~/.config/swaync
mkdir -p ~/Pictures

echo "=== Criando arquivo de sessão do Hyprland (caso não exista) ==="

sudo mkdir -p /usr/share/wayland-sessions
sudo tee /usr/share/wayland-sessions/hyprland.desktop > /dev/null << 'EOF'
[Desktop Entry]
Name=Hyprland
Comment=Hyprland Wayland Compositor
Exec=Hyprland
Type=Application
EOF

echo "=== Criando config básico do Waybar ==="

cat > ~/.config/waybar/config << 'EOF'
{
  "layer": "top",
  "position": "top",
  "height": 28,
  "modules-left": ["hyprland/workspaces"],
  "modules-center": ["clock"],
  "modules-right": ["tray"],
  "hyprland/workspaces": {
    "format": "{icon}",
    "on-click": "activate",
    "format-icons": {
      "1": "1",
      "2": "2",
      "3": "3",
      "4": "4",
      "5": "5",
      "6": "6",
      "7": "7",
      "8": "8",
      "9": "9"
    }
  },
  "clock": {
    "format": "{:%H:%M}"
  },
  "tray": {
    "icon-size": 16,
    "spacing": 6
  }
}
EOF

cat > ~/.config/waybar/style.css << 'EOF'
* {
  font-family: monospace;
  font-size: 13px;
}

window#waybar {
  background: rgba(20, 20, 30, 0.9);
  color: #cdd6f4;
}

#workspaces button {
  padding: 0 8px;
  background: transparent;
  color: #cdd6f4;
}

#workspaces button.active {
  background: #87cf69;
  color: #11111b;
}

#clock,
#tray {
  padding: 0 8px;
  margin: 0 4px;
}
EOF

echo "=== Criando config básico do swaync ==="

cat > ~/.config/swaync/config.json << 'EOF'
{
  "positionX": "right",
  "positionY": "top",
  "layer": "overlay",
  "control-center-layer": "top",
  "layer-shell": true,
  "cssPriority": "application",
  "control-center-width": 400,
  "control-center-height": 600,
  "notification-window-width": 350,
  "notification-icon-size": 64,
  "notification-body-image-height": 100,
  "notification-body-image-width": 200,
  "timeout": 10,
  "timeout-low": 5,
  "timeout-critical": 0,
  "fit-to-screen": false,
  "control-center-margin-top": 10,
  "control-center-margin-bottom": 10,
  "control-center-margin-right": 10,
  "control-center-margin-left": 10,
  "notification-2fa-action": true,
  "notification-inline-replies": false,
  "notification-icon-cornerRadius": 0,
  "notification-cornerRadius": 12,
  "notification-window-cornerRadius": 12,
  "notification-window-margin-top": 10,
  "notification-window-margin-bottom": 10,
  "notification-window-margin-right": 10,
  "notification-window-margin-left": 10,
  "notification-window-margin": 10,
  "keyboard-shortcuts": true,
  "image-visibility": "when-available",
  "transition-time": 200,
  "hide-on-clear": false,
  "hide-on-action": true,
  "script-fail-notify": true,
  "scripts": {}
}
EOF

cat > ~/.config/swaync/style.css << 'EOF'
* {
  font-family: monospace;
  font-size: 13px;
}

.notification {
  background: rgba(20, 20, 30, 0.95);
  color: #cdd6f4;
  border-radius: 12px;
}

.control-center {
  background: rgba(20, 20, 30, 0.95);
  color: #cdd6f4;
  border-radius: 12px;
}
EOF

echo "=== Criando configs básicos de hyprlock e hyprpaper ==="

cat > ~/.config/hypr/hyprlock.conf << 'EOF'
background {
  path = ~/Pictures/wallpaper.png
  blur_passes = 3
  blur_size = 8
}

label {
  text = "Hey, $USER"
  position = 0, 180
  halign = center
  valign = center
  font_size = 20
  color = #cdd6f4
}

label {
  text = "cmd[1000] echo '$(date +\"%H:%M\")'"
  position = 0, 120
  halign = center
  valign = center
  font_size = 40
  color = #87cf69
}
EOF

cat > ~/.config/hypr/hyprpaper.conf << 'EOF'
[general]
fill = cover

[wallpaper]
monitor = *
path = ~/Pictures/wallpaper.png
EOF

echo "=== Adicionando exec-once no hyprland.conf (se existir) ==="

if [ -f ~/.config/hypr/hyprland.conf ]; then
  # Adiciona exec-once se não existir
  if ! grep -q "exec-once = waybar" ~/.config/hypr/hyprland.conf; then
    cat >> ~/.config/hypr/hyprland.conf << 'EOF'

# Exec-once para apps básicos
exec-once = /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
exec-once = waybar
exec-once = swaync
exec-once = /usr/lib/xdg-desktop-portal-hyprland
exec-once = hyprpaper
EOF
  fi
fi

echo "=== Ativando serviços do PipeWire ==="

sudo systemctl enable --now pipewire.socket
sudo systemctl enable --now pipewire-pulse.socket
sudo systemctl enable --now wireplumber.service

echo "=== Setup básico concluído ==="
echo ""
echo "Próximos passos:"
echo "1) Coloque uma imagem em ~/Pictures/wallpaper.png"
echo "2) Recarregue o Hyprland: hyprctl reload"
echo "3) Customize os arquivos em ~/.config/hypr, ~/.config/waybar, etc."
