# Drop in starship.rs configs

These are some premade starship.rs set ups I've made for some of the machines I find myself sshing into most often. Nothing too crazy, but helps quickly distinguish them at a quick glance when I have a bunch open on the same workspace.

### Set up:

Set up is easy! First install starship.rs *(check [this](https://starship.rs/guide/) site for updated instruction)*, then you just have to take one of the config files from this folder, and copy it to ~/config/starship.toml

This can be streamlined with `scp`, for example:

```bash
scp fedora.toml user@192.168.1.x:~/config/starship.toml
```
󰭺