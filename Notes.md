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
