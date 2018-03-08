
# GPGit

#### GPG file encryption wrapper, using GPG's strongest command-line encryption options.


## Purpose

Encrypt a file with *GNU Privacy Guard (GPG)* using the strongest cipher and key-strengthening options offered by GPG.

The GPG symmetric file encryption defaults (CAST5 and SHA-1 on older GPG versions) are weak choices compared to other options available.

And the command-line switches to enable the stronger GPG options are verbose, not easily-remembered, and inconvenient.

The GPGit script provides a single command to call GPG with its strongest file encryption options.


## Requirements

+ GPG installed.

+ GPGit script placed in a $PATH directory.

GPG is present by default on most Linux distros (`whereis gpg` or `whereis gpg2`), else it is available from the distro repos.

(GPG2 is to be preferred if it is installed on the machine, as it is more resistant to attack. Replace `gpg` with `gpg2` in the *gpgit* script.)

GPG for Windows is available from websites such as [GPG4Win](https://www.gpg4win.org/), or the standalone command-line executable can be extracted from a Git installation.


## Files

### Linux

*gpgit*

### Windows

*gpgit.bat*


## Set-up

### Linux

As your preferred user:

        chmod 700 gpgit

        sudo mv gpgit /usr/local/bin

*/usr/local/bin* is just an example $PATH location

### Windows

Move *gpgit.bat* to a suitable directory. Ensure that directory is in the PATH variable. If not add the directory: *Windows/Super key + Break > Advanced tab > Environmental Variables button > click Path line > Edit button > Variable value* - append at the end of existing line info: *C:\directory path\to gpgit.bat\;*


## Usage

### Linux and Windows

        gpgit <filename>

GPG asks for a passphrase (and confirmation) and then creates an encrypted copy of the original file with the file extension *.gpg*

Decrypt the encrypted file with:

        gpg <filename>.gpg

#### Applying Cascade Encryption

        gpgit <filename> -c

GPG asks for two passphrases (passphrase one, confirmation; passphrase two, confirmation), and creates two files. The file with the double extension *.gpg.gpg* is the cascade-encrypted file.

Two steps of decryption will be required, e.g. for *secret.txt.gpg.gpg*:

        gpg secret.txt.gpg.gpg
then

        gpg secret.txt.gpg

resulting in *secret.txt*


## Ciphers

The default AES256 cipher call used in GPGit can be replaced with other ciphers offered by GPG.

TWOFISH and CAMELLIA256 are the strongest cipher alternatives to AES256.


## License

GPGit is released under the [GPL v.3](https://www.gnu.org/licenses/gpl-3.0.html).
