
# Quick guide for making ssh keys for GitHub

## Generate an SSH key

```sh
ssh-keygen -t ed25519 -C "your_email@example.com"
```

Follow the steps on the screen.

## Add to ssh-agent

start the agent

```sh
eval "$(ssh-agent -s)"
```

add to the agent
```sh
ssh-add ~/.ssh/id_ed25519
```

## Add SSH key to Github

copy over ~/.ssh/id_ed25519.pub and paste into field for SSH keys in `SSH and GPG keys` under user settings.



