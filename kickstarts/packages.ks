# Select the following packages for installation
repo --name=ondisk --baseurl=file:///run/install/repo/ondisk
%packages --excludedocs
@^Workstation
scap-security-guide
authselect-compat
%end
