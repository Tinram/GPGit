
# GPGit

#### GPG file encryption wrapper, using GPG's strongest command-line encryption options.


## Purpose

Encrypt a file with *GNU Privacy Guard (GPG)* using the strongest cipher and key-strengthening options offered by GPG.

The default GPG symmetric file encryption settings (CAST5 and SHA-1 on older GPG versions) are weaker choices compared to other options available.

And the command-line switches to enable the stronger GPG options are verbose, not easily-remembered, and inconvenient.

GPGit provides a single command to call GPG with its strongest file encryption options.


## Requirements

+ GPG installed.

+ GPGit script placed in a directory location in *$PATH*.

GPG is present by default on most Linux distros (`whereis gpg` or `whereis gpg2`), else it is available from the distro repos.

(GPG2 is to be preferred, if it is installed on the machine, as it is more resistant to attack. Replace `gpg` with `gpg2` in the *gpgit* script.)

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

*/usr/local/bin* is just an example of a *$PATH* location.

### Windows

Move *gpgit.bat* to a suitable directory. Ensure that directory is in the PATH variable. If not add the directory: *Windows/Super key + Break > Advanced tab > Environmental Variables button > click Path line > Edit button > Variable value* - append at the end of existing line info: *C:\directory path\to gpgit.bat\;*


## Usage

### Linux and Windows

        gpgit <filename>

GPG asks for a passphrase (and confirmation) and then creates an encrypted copy of the original file with the file extension *.gpg*

Decrypt the encrypted file with:

        gpg <filename>.gpg

#### Apply Cascade Encryption

        gpgit <filename> -c

GPG asks for two passphrases (passphrase one, confirmation; gpgit message: *applying cascade encryption [...]*; passphrase two, confirmation), and creates two files. The file with the double extension *.gpg.gpg* is the cascade-encrypted file.

Two steps of decryption will be required, e.g. for *secret.txt.gpg.gpg*

        gpg secret.txt.gpg.gpg
then

        gpg secret.txt.gpg

resulting in *secret.txt*


## Ciphers

The default AES256 cipher call used in GPGit can be replaced with other ciphers offered by GPG.

TWOFISH and CAMELLIA256 are the strongest cipher alternatives to AES256.


## GPG / GPGit File Comparisons

    gpg --version
    gpg (GnuPG) 1.4.20
    Copyright (C) 2015 Free Software Foundation, Inc.

        pgpdump default.txt.gpg

            Sym alg - AES with 128-bit key(sym 7)
            Iterated and salted string-to-key(s2k 3):
            Hash alg - SHA1(hash 2)
            Salt - 8f c8 6b 9a b0 b8 c2 10
            Count - 65536(coded count 96)

        pgpdump gpgit.txt.gpg

            Sym alg - AES with 256-bit key(sym 9)
            Iterated and salted string-to-key(s2k 3):
            Hash alg - SHA512(hash 10)
            Salt - a6 60 04 ad f3 e8 09 43
            Count - 65011712(coded count 255)


    gpg2 --version
    gpg (GnuPG) 2.1.11
    libgcrypt 1.6.5
    Copyright (C) 2016 Free Software Foundation, Inc.

        pgpdump default2.txt.gpg

            Sym alg - AES with 128-bit key(sym 7)
            Iterated and salted string-to-key(s2k 3):
            Hash alg - SHA1(hash 2)
            Salt - 9c 2f ca 1f 9e 19 e5 eb
            Count - 31457280(coded count 238)

        pgpdump gpgit2.txt.gpg

            Sym alg - AES with 256-bit key(sym 9)
            Iterated and salted string-to-key(s2k 3):
            Hash alg - SHA512(hash 10)
            Salt - 31 13 57 9c 49 54 d2 f8
            Count - 65011712(coded count 255)


## License

GPGit is released under the [GPL v.3](https://www.gnu.org/licenses/gpl-3.0.html).
