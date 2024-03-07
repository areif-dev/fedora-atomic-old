ARG SOURCE_IMAGE="${SOURCE_IMAGE:-base-main}"
ARG SOURCE_ORG="${SOURCE_ORG:-ublue-os}"
ARG BASE_IMAGE="ghcr.io/${SOURCE_ORG}/${SOURCE_IMAGE}"
ARG FEDORA_MAJOR_VERSION="${FEDORA_MAJOR_VERSION:-39}"

FROM ${BASE_IMAGE}:${FEDORA_MAJOR_VERSION}

RUN rpm-ostree install \
    alacritty \
    ansible \
    bluez \
    bluez-tools \
    cascadia-code-pl-fonts \
    dbus-daemon \
    dbus-tools \
    dunst \
    gnome-keyring \
    google-noto-emoji-fonts \
    gvfs-mtp \
    grim \
    grimshot \
    jmtpfs \
    lxpolkit \
    NetworkManager \
    NetworkManager-tui \
    openssh \
    openssl \
    papirus-icon-theme \
    pipewire \
    playerctl \
    polkit \
    ranger \
    ripgrep \
    rofi-wayland \
    sway \
    swaybg \
    swayidle \
    swaylock \
    tailscale \
    thunar \
    thunar-archive-plugin \
    thunar-volman \
    unzip \
    waybar \
    wireplumber \
    wl-clipboard \
    xdg-desktop-portal-wlr \
    xdg-user-dirs \
    xorg-x11-server-Xwayland \
    zip \
    zsh \
    zsh-autosuggestions

RUN rpm-ostree remove openrgb-udev-rules

RUN ostree container commit && \
    mkdir -p /var/tmp && chmod -R 1777 /var/tmp
