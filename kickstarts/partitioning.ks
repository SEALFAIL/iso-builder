zerombr
ignoredisk --only-use=%TARGET_BLOCK_DEVICE%
clearpart --all --initlabel --drives=%TARGET_BLOCK_DEVICE%
part	/boot/efi       --fstype=efi	--size=512	--ondisk=%TARGET_BLOCK_DEVICE%
part	/boot		--fstype=xfs	--size=512	--ondisk=%TARGET_BLOCK_DEVICE%
part    swap 				--size=8192	--ondisk=%TARGET_BLOCK_DEVICE%
part	/tmp		--fstype=tmpfs	--size=4096
part	pv.01				--size=1	--ondisk=%TARGET_BLOCK_DEVICE% --grow
volgroup sealfail pv.01
logvol	/		--fstype=xfs	--size=16384	--ondisk=%TARGET_BLOCK_DEVICE% --grow --encrypted --passphrase=temppass --luks-version=luks2
