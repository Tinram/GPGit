
@echo off

REM GPGit - Windows batch script to strengthen the symmetric encryption of a file by GnuPG
REM
REM Usage:      gpgit <filename>
REM Author:     Martin Latter, 23/03/2016
REM Version:    0.1
REM License:    GNU GPL version 3.0 (GPL v3); http://www.gnu.org/licenses/gpl.html
REM Link:       https://github.com/Tinram/GPGit.git


if "%~1"=="" goto fnabort

gpg -c --s2k-mode 3 --s2k-count 65011712 --s2k-digest-algo SHA512 --cipher-algo AES256 %1

goto end

:fnabort
echo usage: gpgit ^<filename^>

goto end

:end
