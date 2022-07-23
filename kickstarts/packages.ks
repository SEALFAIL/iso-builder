repo --name=ondisk	--baseurl=file:///run/install/repo/ondisk
repo --name=AppStream	--baseurl=file:///run/install/repo/AppStream

%packages --excludedocs
@^Workstation
scap-security-guide
sealfail-scap-profile
clevis-dracut
clevis-luks
clevis-systemd
%end
