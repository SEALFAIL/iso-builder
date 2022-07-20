zerombr
ignoredisk --only-use=%TARGET_BLOCK_DEVICE%
clearpart --all --initlabel --drives=%TARGET_BLOCK_DEVICE%
part	/boot/efi       --fstype=efi	--size=256	--ondisk=%TARGET_BLOCK_DEVICE%
part    swap 				--size=8192	--ondisk=%TARGET_BLOCK_DEVICE%
part	/tmp		--fstype=ext4	--size=1024	--ondisk=%TARGET_BLOCK_DEVICE%
part	/		--fstype=ext4			--ondisk=%TARGET_BLOCK_DEVICE% --grow 
