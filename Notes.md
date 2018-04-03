# Notes

## 2018-03-31

Having seen the WSL-DistroLauncher [https://github.com/Microsoft/WSL-DistroLauncher] I wanted to try building my own. Having tried (and failed) to build an LFS build in the past, I wanted to see if this is possible.

Initial assumptions:

* WSL provides a 'kernel' so I should not provide a kernel or boot-loader.
* install.tar.gz is required to install a distro. I haven't found good documentation on the contents but *assume* it's a root file system.

Next steps:

1. Use a WSL Ubuntu setup to start downloading and building LFS.
    1. I looked at ALFS but I don't want to play with automation of something I'm doing the *wrong* way.
    1. I'll build scripts to be reliable and repeatable.
    1. Using version 8.2 of LFS.
1. Build the LFS root file system and assume it can be used for install.tar.gz. *Then we test.*

### Preparing for the Build

This is part II of the LFS book.

TASK: Check host system for prerequisites. Script in scripts/check-versions.sh

(git commit and Nano editor hurts my brain. Check $EDITOR. *Empty*)

Issues with current WSL Ubuntu evnvironment.

* /bin/sh points to /bin/dash
* bison, m4, makeinfo and yacc not found. 
* Kernel is 4.4 so *should* be good.

Attempt to install missing prerequisites.

``` shell
sudo apt-get install bison
sudo apt-get install texinfo
```

Bison includes yacc and pulled in m4 as well. Texinfo pulled in a lot of packages and looks like it's setting up TeX.

The only remaining problem is /bin/dash. It *should* work but may require a fix. I'm installing checkbashisms to test for obvious problems.

``` shell
sudo apt-get install devscripts
```

Removing check-versions.sh as I didn't add any value to the LFS version.

Working with a version of the repo in Windows / VSCode and a version in the WSL Ubuntu is getting tedious. This might require a rethink.

### Disk partitioning

Do I need a separate partition? Can I even create one? I shouldn't be doing anything that works with a partition. I'm only creating a root file system.

### LFS target

* Created /opt/lfs as lfs root folder
* Added ```export LFS=/opt/lfs``` to .bashrc and /root/.bashrc. .profile calls .profile
* Need to explicitly add this to scripts. Make doubly sure and counter /bin/dash.

### Packages and patches

Added config.sh to hold configuration variables.

Source packages will be downloaded to $LFS/sources

Rebooting a WSL 'computer' isn't clear-cut so don't assume things will stay in place. If all terminals close, you may have rebooted the system. Probably want explicit setups.

The Wget list was easy but may have pulled down a lot of code I don't need. *Probably need to make my own clean list at the end of this.*

get-sources.sh works and just used 374 MB of an SSD. *Move LFS to the NAS.*

## 2018-04-03

Time to build the toolchain.

Chapter 4.

Setup the tools folder.

``` shell
mkdir $LFS/tools
ln -s $LFS/tools /
```

Add the LFS user. (Don't build things as root.)

``` shell
groupadd lfs
useradd -s /bin/bash -g lfs -m -k /dev/null lfs
```

Give lfs access to $LFS/sources.

``` shell
chown lfs $LFS/sources
```

Logging in as lfs, configure bare environment.

Chapter 5-Constructing a Temporary System

Changing /bin/sh from dash to bash. *Let's see if this hoses the parent.*
