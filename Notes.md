# Notes

## 2018-03-31

Having seen the WSL-DistroLauncher [https://github.com/Microsoft/WSL-DistroLauncher] I wanted to try building my own. Having tried (and failed) to build an LFS build in the past, I wanted to see if this is possible.

Initial assumptions:

* WSL provides a 'kernel' so I should not provide a kernel or boot-loader.
* install.tar.gz is required to install a distro. I haven't found good documentation on the contents but *assume* it's a root file system.

Next steps:

1. Use a WSL Ubuntu setup to start downloading and building LFS.
    1. I looked at ALFS but I don't want to play with automation of something I'm doing the *wrong* way.
1. Build the LFS root file system and assume it can be used for install.tar.gz.