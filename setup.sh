#!/usr/bin/env bash
# more simplistic setup
# usually ive already set root pw at this step
pacman -S --needed --noconfirm zram-generator ufw micro

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
ufw enable
systemctl enable ufw

pacman -S --needed --noconfirm seatd sway foot
systemctl enable --now seatd
usermod -aG seat hadean
