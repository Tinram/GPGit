
@echo off

REM GPGit
REM
REM Windows batch script to strengthen symmetric file encryption by GnuPG.
REM
REM Usage:      gpgit <filename>
REM Author:     Martin Latter, 23/03/2016, 17/11/2016
REM Version:    0.14
REM License:    GNU GPL version 3.0 (GPL v3); http://www.gnu.org/licenses/gpl.html
REM Link:       https://github.com/Tinram/GPGit.git


if "%~1"=="" goto fnabort
if "%1"=="-c" goto fnabort

gpg -c --s2k-mode 3 --s2k-count 65011712 --s2k-digest-algo SHA512 --cipher-algo AES256 --require-secmem -z 9 %1

REM cascade encryption: two passphrases required, take the resulting <filename>.gpg.gpg file
if "%~2"=="-c" (
    echo applying cascade encryption: second password required ...
    gpg -c --s2k-mode 3 --s2k-count 65011712 --s2k-digest-algo SHA512 --cipher-algo TWOFISH --require-secmem -z 9 %1.gpg
)

goto end

:fnabort
echo usage: gpgit ^<filename^> [-c]

goto end

:end
