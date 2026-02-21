sudo zypper install code
sudo zypper install tmux
sudo zypper install docker docker-compose
sudo zypper install podman
sudo zypper install python313-virtualenvwrapper
sudo zypper install make
sudo zypper install rocm-smi
sudo zypper install radeontop
sudo zypper install gitk tig
sudo zypper install npm
sudo zypper install --from packman vlc
sudo zypper install vlc
sudo zypper install gnubg
sudo zypper install zig && zig zen
sudo zypper install mc

sudo zypper install snapd
sudo systemctl enable --now snapd
sudo systemctl enable --now snapd.apparmor
sudo snap install obsidian --classic
sudo snap install p3x-redis-ui
sudo snap install postman
sudo snap install foobillard-plus

sudo zypper install --recommends kernel-firmware ???
sudo zypper install xorg-x11 evtest ???

sudo zypper addrepo --refresh https://download.opensuse.org/repositorie/system:/snappy/openSUSE_Tumbleweed snappy

sudo zypper ar -cfp 90 https://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Tumbleweed/Essentials/ packman-essentials && sudo zypper ref && sudo zypper in vlc-codecs

curl -fsSL https://ollama.com/install.sh | sh
curl -fsSL https://claude.ai/install.sh | bash
curl -fsSL https://opencode.ai/install | bash
curl -LsSf https://astral.sh/uv/install.sh | sh
curl -fsSL https://bun.com/install | bash
