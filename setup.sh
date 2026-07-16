#!/usr/bin/env bash
# more simplistic setup made for my laptop
# usually ive already set root pw at this step `passwd root`

pacman -S --needed --noconfirm zram-generator ufw micro terminus-font

# art above, stock \S{PRETTY_NAME} \r (\l) line stays at the bottom.
# ':::' guard keeps reruns from stacking copies; quoted heredoc
# because the art itself contains single quotes
if ! grep -q ':::' /etc/issue; then
      { cat <<'EOF'

                       .
                      .:.
                     .:::.
                    .:::::.
                   .:::::::.
                  .:::::::::.
                 .::::.:.::::.
                .::::.:::.::::.
               .::::.:::::.::::.
              .::::.:::::::.::::.
             .::::.:::::::::.::::.
            .::::.::::.:.::::.::::.
           .::::.::::'   '::::.::::.
          .::::.::::'     '::::.::::.
         .::::.::::'       '::::.::::.
        .::::.::::'         '::::.::::.
             .:::'           ':::.
   ::.      .:::'             ':::.      .::
    :::.   .:::'               ':::.   .:::
  ::::::::::::'                 '::::::::::::
      :::. .:'                   ':. .:::
       :::..:          .:.          :..:::
        :::.'          ':'          '.:::
          ::.                       .::
         .':::.                   .:::'.
        .'  :::.                 .:::  '.
       .'    :::.               .:::    '.

EOF
      cat /etc/issue; } > /etc/issue.new
      mv /etc/issue.new /etc/issue
fi

echo "[zram0]" > /etc/systemd/zram-generator.conf
echo "EDITOR=micro" >> /etc/environment
#echo "KEYMAP=be-latin1" >> /etc/vconsole.conf
echo "FONT=ter-p24n" >> /etc/vconsole.conf

ufw enable
systemctl enable ufw

# system done; user next, no sudo priv

pacman -S --needed --noconfirm \
	seatd \
	sway \
	foot \
	# essentials done
	pipewire-pulse \
	wireplumber \
	sof-firmware \
	pavucontrol \
	pipewire-alsa \
	pipewire-jack \
	gst-plugin-pipewire \
	libpulse \
	# sound done
	brightnessctl \
	grim \
	slurp \
	xorg-xwayland

systemctl enable --now seatd
systemctl --global enable pipewire-pulse.socket wireplumber.service

useradd -m hadean && usermod -aG seat hadean

#echo "export XKB_DEFAULT_LAYOUT=be" >> /home/hadean/.bash_profile
#echo "export XKB_DEFAULT_VARIANT=nodeadkeys" >> /home/hadean/.bash_profile
echo "exec sway" >> /home/hadean/.bash_profile

# -m creates the home, -aG is standard for groups idek
# all got left to do is passwd hadean from a root shell
# plus probably some sound shenanigans
# this has no sudo or anything the profile is just sway

chown -R hadean:hadean /home/hadean

# thats it folks. not done?
# clone dotfiles, symlink, done?
