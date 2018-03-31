# wsl-lfs
Attempt to build Linux From Scratch in Windows Subsystem for Linux

I'm attempting to build an LFS distribution and then run it as a custom distribution under WSL.

## Key components

The following need to be provided:

* The custom launcher.
* install.tar.gz included with the launcher to bootstrap the distro.

## Sources

LFS [http://www.linuxfromscratch.org/]

The custom launcher. [https://github.com/Microsoft/WSL-DistroLauncher]

The Microsoft blog entry. [https://blogs.msdn.microsoft.com/commandline/2018/03/26/wsl-distro-launcher/]

Debian tools to build install.tar.gz. [https://salsa.debian.org/zobel/WSL]