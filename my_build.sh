#!/bin/bash

# https://stackoverflow.com/questions/6482377/check-existence-of-input-argument-in-a-bash-shell-script
if [ ! $# -eq 1 ]; then
  echo "Exactly one argument required: [amd64 | arm64]"
  exit 1
fi

# https://stackoverflow.com/questions/59895/how-do-i-get-the-directory-where-a-bash-script-is-located-from-within-the-script
rootDir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

if [ $1 = "amd64" ]; then

  mkdir -p $rootDir/output/amd64
  $rootDir/src/build.sh -O $rootDir/obj -U -u -m amd64 -j16 release
  anita --workdir $rootDir/output/anita --disk-size 10G --memory-size 256M install $rootDir/obj/releasedir/amd64/
  mv $rootDir/output/anita/wd0.img $rootDir/output/amd64/netbsd.img

elif [ $1 = "arm64" ]; then

  mkdir -p $rootDir/output/arm64
  $rootDir/src/build.sh -O $rootDir/obj -U -u -m evbarm -a aarch64 -j16 release

fi

exit 0






