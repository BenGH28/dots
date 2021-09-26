# Dots

## Install Arch WSL

You can get Arch for WSL [here](https://github.com/yuk7/ArchWSL)

## Setup Arch

**set root password**

```sh
passwd
```

**enable sudoers**

```sh
echo "%wheel ALL=(ALL) ALL" > /etc/sudoers.d/wheel
```

**add a user**

```sh
useradd -m -G wheel -s /bin/bash {username}
```

**set password for that user**

```sh
passwd {username}
```

**set default user (run this from windows cmd or powershell)**

```sh

Arch.exe config --default-user {username}
```

**set the default distro to Arch**

```sh
wsl -s Arch
```

## Install Configuration

Get [yadm](https://github.com/TheLocehiliosan/yadm) a git wrapper that handles your dotfiles nicely

**http**

```sh
yadm clone https://github.com/BenGH28/dots
```

**ssh**

```sh
yadm clone git@github.com:BenGH28/dots.git
```

**install packages related to the dotfiles**

```sh
scripts/install_packages.sh
```
