![SEALFAIL logo](logo-transparent.png) 

# SEALFAIL ISO BUILDER

This repository contains the necessary scripts and data to build an ISO-format SEALFAIL installation image.

The script has been tested on **Alma Linux 8.6**

## Dependencies

The build process requires `createrepo`, `curl`, `xorriso` and `syslinux` from EPEL:

`# dnf install epel-release && dnf update`

`# dnf install xorriso syslinux createrepo curl`

## Usage

Run the script. You might want to run it as root if you can't use `mktemp`.

`chmod +x build.sh && ./build.sh`

The resulting image will be generated in the `build` directory, along with its SHA256 checksum.

## Repository structure

```
./iso-builder
	iso-patch
		... Files to copy at the root of the to-be-built ISO image
	kickstarts
		... Anaconda kickstarts to run during installation
	product
		... Files necessary to build a SEALFAIL product.img file
```

## Contributing

Refer to the SEALFAIL project [documentation repository](https://github.com/SEALFAIL/Documentation) for information regarding contributions.

## Code of conduct (COC)

Contributors are to follow the code of conduct (COC) located at the SEALFAIL project [documentation repository](https://github.com/SEALFAIL/Documentation).
