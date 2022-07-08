repo --name=ondisk	--baseurl=file:///run/install/repo/ondisk
repo --name=AppStream	--baseurl=file:///run/install/repo/AppStream

%packages --excludedocs
@^Workstation
scap-security-guide
authselect-compat
%end
