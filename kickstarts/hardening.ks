# Post-installation script
%post --erroronfail

# Set clevis binding
clevis luks bind -d /dev/sealfail/root tpm2 '{"pcr_bank":"sha256","pcr_ids":"0,1,7"}' <<< "temppass"
clevis luks bind -d /dev/sealfail/swap tpm2 '{"pcr_bank":"sha256","pcr_ids":"0,1,7"}' <<< "temppass"
#cryptsetup luksRemoveKey /dev/sealfail/root <<< "temppass"
#cryptsetup luksRemoveKey /dev/sealfail/swap <<< "temppass"
dracut -fv --regenerate-all

# I can't believe this one-liner is making it in prod
# Sets a random GRUB2 password
{python3 -c 'print("password_pbkdf2 root")' &  python3 -c 'import string as s; import secrets as x; a=s.ascii_letters+s.digits; p="".join(x.choice(a) for i in range(64)); print(p + "\n" + p)' | grub2-mkpasswd-pbkdf2 | cut -d ' ' -f 7 | sed -r '/^\s*$/d'} | cat | tr '\n' ' ' >> /etc/grub.d/01_users
grub2-mkconfig -o /boot/grub2/grub.cfg

# Disables automounting /boot/efi
sed -i '/efi/ s/nodev/nodev,noauto/g' /etc/fstab

# OpenSCAP run to reach compliance
oscap xccdf eval --remediate --results /root/oscap.xml --profile %SCAP_PROFILE% %SCAP_CONTENT%
oscap xccdf generate report /root/oscap.xml > /root/oscap.html
rm /root/oscap.xml

%end
