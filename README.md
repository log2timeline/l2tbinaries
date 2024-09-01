This repository contains the binaries for the log2timeline projects and
dependencies.

* Plaso [release packages](https://plaso.readthedocs.io/en/latest/sources/user/Releases-and-roadmap.html)
* binary builds of the dependencies for:
  * Python 3.12 Windows 32-bit and 64-bit (requires Visual Studio 2017 runtime)

For Fedora binary builds use [the gift COPR](https://copr.fedorainfracloud.org/groups/g/gift/coprs/),
where the different tracks are:

* @gift/dev: used for development, use this if you are a Plaso developer;
* @gift/stable: used for the latest stable release, use this if you are Plaso end user;
* @gift/staging: used for integration testing, use this if you are a developer or maintainer of project that uses Plaso;
* @gift/testing: used for testing new package uploads, use this if you are a Plaso package maintainer.

For Ubuntu binary builds use [the gift PPA](https://launchpad.net/~gift), where
the different tracks are:

* Development: used for development, use this if you are a Plaso developer;
* Release: used for the latest stable release, use this if you are Plaso end user;
* Staging: used for integration testing, use this if you are a developer or maintainer of project that uses Plaso;
* Testing: used for testing new package uploads, use this if you are a Plaso package maintainer.

For other binary builds try:

* [CERT Forensics Tools Repository](https://forensics.cert.org/) for Fedora and CentOS/RHEL

openSUSE:

* [OpenSUSE security:forensics](https://build.opensuse.org/project/show/security:forensics)

```
sudo zypper addrepo https://download.opensuse.org/repositories/security:/forensics/openSUSE_Leap_15.2/security:forensics.repo
sudo zypper refresh
sudo zypper install python-plaso
```

