#!/usr/bin/env bash

VERSION=$1
DOWNLOADURL='https://otgw.tclcode.com/download'

git clone https://github.com/hvxl/otmonitor.git
cd otmonitor
if [[ ${VERSION} != "latest" ]]; then
	git checkout tags/${VERSION}
fi

curl ${DOWNLOADURL}/sdx-20110317.kit --output sdx.kit
# curl https://otgw.tclcode.com/download/tclkit${PLATFORM}  --output tclkit${PLATFORM}
# curl https://otgw.tclcode.com/download/tclkit${PLATFORM}  --output tclkit${PLATFORM}
# curl https://otgw.tclcode.com/download/tclkit${PLATFORM}  --output tclkit${PLATFORM}
# curl https://otgw.tclcode.com/download/tclkit${PLATFORM}  --output tclkit${PLATFORM}

curl ${DOWNLOADURL}/tclkit --output tclkit
curl ${DOWNLOADURL}/tclkit-x64 --output tclkit-x64
curl ${DOWNLOADURL}/tclkit-ahf --output tclkit-ahf
curl ${DOWNLOADURL}/tclkit-aarch64 --output tclkit-aarch64
curl ${DOWNLOADURL}/tclkit.exe --output tclkit.exe

cp tclkit /usr/local/bin/tclkit
cp tclkit-x64 /usr/local/bin/tclkit-x64
cp tclkit-ahf /usr/local/bin/tclkit-ahf
cp tclkit-aarch64 /usr/local/bin/tclkit-aarch64
cp tclkit.exe /usr/local/bin/tclkit.exe
#chmod +x /usr/local/bin/tclkit
chmod +x /usr/local/bin/tclkit-x64

tclkit-x64 sdx.kit wrap /data/otmonitor -vfs otmonitor.vfs -runtime tclkit
tclkit-x64 sdx.kit wrap /data/otmonitor-x64 -vfs otmonitor.vfs -runtime tclkit-x64
tclkit-x64 sdx.kit wrap /data/otmonitor-ahf -vfs otmonitor.vfs -runtime tclkit-ahf
tclkit-x64 sdx.kit wrap /data/otmonitor-aarch64 -vfs otmonitor.vfs -runtime tclkit-aarch64
tclkit-x64 sdx.kit wrap /data/otmonitor.exe -vfs otmonitor.vfs -runtime tclkit.exe

