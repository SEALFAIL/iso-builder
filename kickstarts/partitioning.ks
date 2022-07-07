zerombr
ignoredisk --only-use=%TARGET_BLOCK_DEVICE%
clearpart --all --initlabel --drives=%TARGET_BLOCK_DEVICE%
part	/		--fstype=xfs	--size=16384	--ondisk=%TARGET_BLOCK_DEVICE%
part	/boot/efi       --fstype=efi	--size=4096	--ondisk=%TARGET_BLOCK_DEVICE%	
part	/tmp		--fstype=tmpfs	--size=1024
part    swap 				--size=4096	--ondisk=%TARGET_BLOCK_DEVICE%	