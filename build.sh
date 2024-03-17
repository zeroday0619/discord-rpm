#!/bin/sh

set -e
set -x

if ! [[ -r $(pwd)/discord.deb ]]; then
    wget 'https://discordapp.com/api/download?platform=linux&format=deb' -O discord.deb
fi

alien --scripts -r -v -g discord.deb
sed -i 's#%dir "/"##' $(pwd)/discord-*/discord-*-2.spec
sed -i 's#%dir "/usr/bin/"##' $(pwd)/discord-*/discord-*-2.spec
echo "%changelog" | tee -a $(pwd)/discord-*/discord-*-2.spec
echo "* "$(LC_ALL=c date +"%a")" "$(LC_ALL=c date +"%b")"   "$(LC_ALL=c date +"%d")" "$(LC_ALL=c date +"%Y")" ""Euiseo Cha <zeroday0619_dev@outlook.com> - repackaging version 0.0.1" | tee -a $(pwd)/discord-*/discord-*-2.spec
echo "- Auto packaging" | tee -a $(pwd)/discord-*/discord-*-2.spec
rpmbuild --buildroot $(pwd)/discord-* -bb $(pwd)/discord-*/discord-*-2.spec
