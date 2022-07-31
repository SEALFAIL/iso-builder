# Post-installation script
%post --erroronfail

# Set clevis binding
clevis luks bind -d /dev/sealfail/root tpm2 '{"pcr_bank":"sha256","pcr_ids":"0,1,7"}' <<< "temppass"
clevis luks bind -d /dev/sealfail/swap tpm2 '{"pcr_bank":"sha256","pcr_ids":"0,1,7"}' <<< "temppass"
#cryptsetup luksRemoveKey /dev/sealfail/root <<< "temppass"
#cryptsetup luksRemoveKey /dev/sealfail/swap <<< "temppass"
dracut -fv --regenerate-all

# Delay the Plymouth LUKS password prompt, let the TPM unlock the devices
echo 'ExecStartPre=/bin/sleep 10' >> /usr/lib/systemd/system/systemd-ask-password-plymouth.service

# Disables automounting /boot/efi
sed 0u '/luks/ s/defaults/ro/g' /etc/fstab
sed -i '/efi/ s/defaults/nodev,noauto/g' /etc/fstab

# Set cryptographic policy
update-crypto-policies --set FUTURE

# OpenSCAP run to reach compliance
oscap xccdf eval --remediate --results /root/oscap.xml --profile %SCAP_PROFILE% %SCAP_CONTENT%
oscap xccdf generate report /root/oscap.xml > /root/oscap.html
rm /root/oscap.xml

%end
