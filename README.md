# dotfiles

[![Contribute](http://beta.codenvy.com/factory/resources/codenvy-contribute.svg)](http://beta.codenvy.com/f?url=https://gitlab.com/iladin/dotfiles)

My dotfiles hosted on [gitlab.com](http://gitlab.com/iladin/dotfiles)

[![GitPitch](https://gitpitch.com/assets/badge.svg)](https://gitpitch.com/iladin/dotfiles/master?grs=gitlab&t=white)

## Status

[![Build Status](https://gitlab.com/iladin/dotfiles/badges/master/build.svg)](https://gitlab.com/iladin/dotfiles/pipelines)

## Code Climate

[![Issue Count](https://codeclimate.com/github/iladin/dotfiles/badges/issue_count.svg)](https://codeclimate.com/github/iladin/dotfiles)
[![Test Coverage](https://codeclimate.com/github/iladin/dotfiles/badges/coverage.svg)](https://codeclimate.com/github/iladin/dotfiles/coverage)
[![Code Climate](https://codeclimate.com/github/iladin/dotfiles/badges/gpa.svg)](https://codeclimate.com/github/iladin/dotfiles)

## TODO

### Files

.codenvy.json  Inspired by <https://gitlab.com/gitlab-org/gitlab-ce/issues/12759>

### Topics

NixOS

## Tools

rr

silversearcher-ag

catimg

ptop

nethogs

bashtrace

NcursesFM

vcat

## Links

[http://dockerfile-linter.com/?lang=en](http://dockerfile-linter.com/?lang=en)

## Install

### Windows

### WSL

```powershell
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
wsl --set-default-version 2
```

[Windows x64 patch](https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi)

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
