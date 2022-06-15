# Install locally, with GUI
graphical
cdrom

# GRUB2 configuration
bootloader --boot-drive=%TARGET_BLOCK_DEVICE% --timeout=0 --append="rhgb quiet"

# Automatically accept EULA
eula --agreed

# Reboot after install
# Don't start the first-boot setup thing
reboot
firstboot --disable

# We use authselect-compat
authselect --passalgo=sha512 --useshadow

# Enable SELinux
selinux --enforcing

# Configure kdump
%addon com_redhat_kdump --enable --reserve-mb=auto
%end

# Enable DHCP, set hostname
# Allow SSH and Cockpit
network  --bootproto=dhcp --device=enp0s3 --onboot=on --activate --hostname=alma.lan

# Set up the partitions
%include /mnt/install/repo/partitioning.ks

# User config
%include /mnt/install/repo/users.ks

# Package selection
%include /mnt/install/repo/packages.ks

## OpenSCAP hardening
#%include /mnt/install/repo/openscap.ks

# Hardening post-install script
%include /mnt/install/repo/hardening.ks

# General post-install script
%include /mnt/install/repo/post.ks
