This repository contains the binaries for the log2timeline projects and
dependencies.

* plaso [release packages](https://github.com/log2timeline/plaso/wiki/Releases-and-roadmap)
* binary builds of the dependencies for:
  * Python 2.7 macOS 10.13
  * Python 2.7 Windows 32-bit and 64-bit (requires Visual Studio 2008 runtime)
  * Python 3.6 Windows 32-bit and 64-bit (requires Visual Studio 2017 runtime)

For Ubuntu binary builds use [the gift PPA](https://launchpad.net/~gift), where
the different tracks are:

* Bleeding edge: used for development, use this if you are a plaso developer;
* Release: used for the latest stable release, use this if you are plaso end user;
* Testing: used for testing new package uploads, use this if you are a plaso package maintainer.

For other binary builds try:

* [CERT Forensics Tools Repository](https://forensics.cert.org/) for Fedora and CentOS/RHEL

openSUSE:
```
sudo zypper addrepo
http://download.opensuse.org/repositories/security:forensics/openSUSE_13.2/security:forensics.repo
sudo zypper refresh
sudo zypper install python-plaso
```

