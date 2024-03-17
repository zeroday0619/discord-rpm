#!/bin/sh

set -e
set -x

if ! [[ -r $(pwd)/discord.deb ]]; then
    wget 'https://discordapp.com/api/download?platform=linux&format=deb' -O discord.deb
fi

sudo alien --scripts -r -v -g discord.deb
sudo sed -i 's#%dir "/"##' $(pwd)/discord-*/discord-*-2.spec
sudo sed -i 's#%dir "/usr/bin/"##' $(pwd)/discord-*/discord-*-2.spec
cd $(pwd)/discord-*
sudo rpmbuild --target=x86_64 --buildroot -bb discord-*-2.spec
