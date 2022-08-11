#!/bin/sh

set -e
set -x

wget 'https://discordapp.com/api/download?platform=linux&format=deb' -O discord.deb
sudo alien --scripts -r -v -g discord.deb
sudo sed -i 's#%dir "/"##' discord/discord-2.spec
sudo sed -i 's#%dir "/usr/bin/"##' discord/discord-2.spec
sudo rpmbuild --target=x86_64 --buildroot ~/Downloads/discord/ -bb discord-0.0.9-2.spec