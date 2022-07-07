# Select the following packages for installation
repo --name=ondisk		--baseurl=file:///run/install/sources/mount-0000-hdd-device/ondisk
%packages --excludedocs
@^Minimal
scap-security-guide
authselect-compat
%end
