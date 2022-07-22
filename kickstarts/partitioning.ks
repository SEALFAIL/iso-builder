zerombr
ignoredisk --only-use=%TARGET_BLOCK_DEVICE%
clearpart --all --initlabel --drives=%TARGET_BLOCK_DEVICE%
part	/boot/efi       --fstype=efi	--size=1024	--ondisk=%TARGET_BLOCK_DEVICE%
part	/boot		--fstype=xfs	--size=1024	--ondisk=%TARGET_BLOCK_DEVICE%
part	pv.01				--size=1	--ondisk=%TARGET_BLOCK_DEVICE% --grow
volgroup sealfail pv.01
logvol	swap		--fstype="swap"	--size=8192		--vgname=sealfail --name=swap --encrypted --passphrase=temppass --luks-version=luks2
logvol	/		--fstype="xfs"	--size=32768	--grow	--vgname=sealfail --name=root --encrypted --passphrase=temppass --luks-version=luks2
