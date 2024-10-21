# dotfiles

[![Contribute](http://beta.codenvy.com/factory/resources/codenvy-contribute.svg)](http://beta.codenvy.com/f?url=https://gitlab.com/iladin/dotfiles)

My dotfiles hosted on [github.com](http://github.com/iladin/dotfiles)

## Code Climate

[![Issue Count](https://codeclimate.com/github/iladin/dotfiles/badges/issue_count.svg)](https://codeclimate.com/github/iladin/dotfiles)
[![Test Coverage](https://codeclimate.com/github/iladin/dotfiles/badges/coverage.svg)](https://codeclimate.com/github/iladin/dotfiles/coverage)
[![Code Climate](https://codeclimate.com/github/iladin/dotfiles/badges/gpa.svg)](https://codeclimate.com/github/iladin/dotfiles)

## Tools

rr

ptop

vcat

## Links

[http://dockerfile-linter.com/?lang=en](http://dockerfile-linter.com/?lang=en)

## Install

### Windows


#### Long paths


```
HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem and set LongPathsEnabled to 1
```

#### Hyper V

Needs to be enabled

### WSL

``` shell
wsl.exe --list --online
wsl.exe --install Ubuntu
```

reboot required

### Fix git for windows

```
git config --global core.sshCommand "'C:\Windows\System32\OpenSSH\ssh.exe'"
```

#### Chocolatey

choco install everything

#### Scoop

```powershell
Set-ExecutionPolicy RemoteSigned -scope CurrentUser
iwr -useb get.scoop.sh | iex
```

```bash
scoop install cygwin
~\scoop\apps\cygwin\current\cygwin-setup.exe -qnBP ansible
```

```bash
~\scoop\apps\cygwin\current\cygwin-setup.exe -qnBP gcc-core,python38-pip,python38-devel,libffi-devel,libssl-devel,openssh
python3.8.exe -m pip install ansible
```

## Rust

### Rustup

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash -x

```
