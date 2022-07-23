# Post-installation script
%post --erroronfail

# Set clevis binding
clevis luks bind -d /dev/sealfail/root tpm2 '{"pcr_bank":"sha256","pcr_ids":"0,1,7"}' <<< "temppass"
clevis luks bind -d /dev/sealfail/swap tpm2 '{"pcr_bank":"sha256","pcr_ids":"0,1,7"}' <<< "temppass"
#cryptsetup luksRemoveKey /dev/sealfail/root <<< "temppass"
#cryptsetup luksRemoveKey /dev/sealfail/swap <<< "temppass"
dracut -fv --regenerate-all

# Set the TTY banner
echo '' > /etc/issue
echo '   _____ _________    __    _________    ______ ' >> /etc/issue
echo '  / ___// ____/   |  / /   / ____/   |  /  _/ / ' >> /etc/issue
echo '  \__ \/ __/ / /| | / /   / /_  / /| |  / // /  ' >> /etc/issue
echo ' ___/ / /___/ ___ |/ /___/ __/ / ___ |_/ // /___' >> /etc/issue
echo '/____/_____/_/  |_/_____/_/   /_/  |_/___/_____/' >> /etc/issue
echo ' Version 9.0'                                     >> /etc/issue
echo ''                                                 >> /etc/issue

# Set the SSH and cockpit banners
sed -i 's/#Banner none/Banner \/etc\/issue/g'
cp /etc/issue /etc/issue.cockpit
cp /etc/issue /etc/banner

# Remove the cockpit message
rm -f /etc/motd.d/cockpit
rm -f /etc/issue.d/cockpit

# Disable the following services
systemctl disable sshd
systemctl disable cockpit.socket

%end
