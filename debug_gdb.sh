#!/bin/bash

rootDir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

qemu-system-x86_64 -nographic -snapshot -hda $rootDir/output/amd64/netbsd.img -m 256

