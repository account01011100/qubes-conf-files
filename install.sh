#!/usr/bin/env bash
###############  #  ##    #     ##       #       #
#
#	QUBES OS dom0 rachel env INSTALLER
#
################  #    ##   ##     #        #         # 


# move configuration files to their respective directories  
user="$(whoami)"
sudo cp -r ocfg/.xinitrc /home/$user/.xinitrc
sudo cp -r dcfg/* /home/$user/.config/

# add aliases to fish
path="/home/$user/.config/fish/config.fish"
echo "if status is-interactive" > $path
echo "end" >> $path
unset path

# install programs I want in dom0
yes | sudo qubes-dom0-update btop fish fzf maim xclip pasystray 

# install build depends for suckless
yes | sudo qubes-dom0-update libX11-devel libXft-devel libXinerama-devel gcc

# compile suckless
dir="$(pwd)/dcfg/custom/sources/"
cd $dir
cd st && sudo make install && cd $dir
cd dmenu && sudo make install && cd $dir
cd slstatus && sudo make install && cd $dir
cd dwm && sudo make install
cd /home/$user/
unset dir user
# remove build depends
yes | sudo dnf remove libX11-devel libXft-devel libXinerama-devel gcc

# remove programs I don't want
yes | sudo dnf remove xfce4-screenshooter nano xterm rxvt-unicode
 
# change default shell to fish
sudo sed -i '/^root:/!s|/bin/bash|/bin/fish|' /etc/passwd
