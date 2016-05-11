
# GPGit


## Purpose

#### Symmetrically encrypt a file with GNU Privacy Guard (GPG) using the strongest encryption and key-strengthening options offered by GPG.

The GPG symmetric file encryption defaults (CAST, SHA-1) are weak compared to other GPG options available.

However, the command-line options to enable the stronger options are verbose and not easily-remembered.


## Requirements

1. GPG installed.

2. The platform-relevant GPGit script placed in a PATH accessible location.

GPG is present by default on most Linux distros (`whereis gpg`), else it is available from the distro repos.

GPG for Windows is available from websites such as [GPG4Win](https://www.gpg4win.org/), or the standalone command-line executable can be extracted from a Git installation.


## Files

**Linux:**

*gpgit*

**Windows:**

*gpgit.bat*


## Set-up

**Linux:**

Move the *gpgit* file to */usr/local/bin*

(or equivalent location available via $PATH)

**Windows:**

Move *gpgit.bat* to a suitable directory.  Ensure that directory is in the PATH variable: *Windows/Super key + Break > Advanced tab > Environmental Variables button > click Path line > Edit button > Variable value* - append at the end of existing line info: *C:\directory paths\to gpgit.bat\;*


## Usage

`gpgit <filename>`


## Ciphers

The AES256 cipher call used in the GPGit script can be replaced with a range of other ciphers offered by GPG.

TWOFISH and CAMELLIA256 are the strongest cipher alternatives to AES256.


## License

GPGit is released under the [GPL v.3](https://www.gnu.org/licenses/gpl-3.0.html).
