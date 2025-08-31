#!/usr/bin/env bash
# shellcheck disable=SC2034

iso_name="StratOS"
iso_label="STRATOS_$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y%m)"
iso_publisher="StratOS Team <https://github.com/StratOS-Linux/StratOS>"
iso_application="StratOS Live ISO"
iso_version="$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y.%m.%d)"
install_dir="stratos"
buildmodes=('iso')
bootmodes=('bios.syslinux.mbr' 'bios.syslinux.eltorito'
           'uefi-ia32.systemd-boot.esp' 'uefi-x64.systemd-boot.esp'
           'uefi-ia32.systemd-boot.eltorito' 'uefi-x64.systemd-boot.eltorito')
arch="x86_64"
pacman_conf="pacman.conf"
airootfs_image_type="squashfs"
airootfs_image_tool_options=('-comp' 'xz' '-Xbcj' 'x86' '-b' '1M' '-Xdict-size' '1M')
bootstrap_tarball_compression=('zstd' '-c' '-T0' '--auto-threads=logical' '--long' '-19')
file_permissions=(
  ["/etc/shadow"]="0:0:400"
  ["/etc/gshadow"]="0:0:400"
  # ["/opt/maneki-neko/main.py"]="0:0:777"
  ["/root"]="0:0:750"
  ["/root/.automated_script.sh"]="0:0:755"
  ["/root/.gnupg"]="0:0:700"
  # ["/usr/local/bin/choose-mirror"]="0:0:755"
  # ["/usr/local/bin/install-bedrock-x86_64"]="0:0:777"
  # ["/usr/local/bin/livecd-sound"]="0:0:755"
  # ["/usr/local/bin/maneki-logo"]="0:0:777"
  # ["/usr/local/bin/neofetch"]="0:0:777"
  # ["/usr/local/bin/install-using-pacman"]="0:0:777"
  # ["/usr/local/bin/install-using-yay"]="0:0:777"
  # ["/usr/local/bin/StratOS-install-apt"]="0:0:777"
  # ["/usr/local/bin/StratOS-choose-atril"]="0:0:777"
  # ["/usr/local/bin/StratOS-choose-chromium"]="0:0:777"
  # ["/usr/local/bin/StratOS-choose-evince"]="0:0:777"
  # ["/usr/local/bin/StratOS-choose-firefox"]="0:0:777"
  # ["/usr/local/bin/StratOS-choose-github"]="0:0:777"
  # ["/usr/local/bin/StratOS-choose-gsconnect"]="0:0:777"
  # ["/usr/local/bin/StratOS-choose-libreoffice"]="0:0:777"
  # ["/usr/local/bin/StratOS-choose-librewolf"]="0:0:777"
  # ["/usr/local/bin/StratOS-choose-mpv"]="0:0:777"
  # ["/usr/local/bin/StratOS-choose-obsidian"]="0:0:777"
  # ["/usr/local/bin/StratOS-choose-onlyoffice"]="0:0:777"
  # ["/usr/local/bin/StratOS-choose-videoplayer"]="0:0:777"
  # ["/usr/local/bin/StratOS-choose-vlc"]="0:0:777"
  # ["/usr/local/bin/StratOS-choose-vscodium"]="0:0:777"
  # ["/usr/local/bin/StratOS-configure-bedrock"]="0:0:777"
  # ["/usr/local/bin/StratOS-configure-browser"]="0:0:777"
  # ["/usr/local/bin/StratOS-configure-distro"]="0:0:777"
  # ["/usr/local/bin/StratOS-configure-gnome"]="0:0:777"
  # ["/usr/local/bin/StratOS-configure-theme"]="0:0:777"
  # ["/usr/local/bin/StratOS-configure-ubuntu"]="0:0:777"
  # ["/usr/local/bin/ucode"]="0:0:777"
  # ["/usr/local/bin/vcheck"]="0:0:777"
  # ["/usr/share/polkit-1/actions/com.github.calamares.calamares.policy"]="0:0:777"
)
