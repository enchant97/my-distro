# My Distro
A distro made by me (Leo Spratt). Built specifically for my personal use, although anyone can really use it either for their own install or just for learning.

> Use this project at your own risk!

## Info
- Live environment creds are: live:live
- Gnome desktop environment
- Uses Arch
- All temp files (apart from built isos) are stored in /tmp/custom-arch-build

## Creating ISO
1. Run `make repo`
2. Run `make iso`
3. Write ISO (found in the out/ directory) to USB stick
4. Run make clean to remove temp files (or clean-all to remove iso & built packages)
5. Install system
6. Enjoy!

## Requirements
- archiso or archiso-git
- paru
- make

## Makefile
The makefile allows for easy deployment of the iso.
### iso
Will clean any existing archiso temp files and then build iso.

### repo
Will get pkg lists from required AUR packages and then build them and add to a local repository.

### clean
Will just remove archiso temp files and clear pkg lists.
### clean-all
Will clean everything including created isos and package builds.

### build-aur
Get required pkg lists from AUR and then build them.

### add-repo-pkgs
Add built packages into repository called "custom".

### mkiso
Make the iso.

## Known Bugs
- Disabling the custom repo in `/pacman.conf` for build is required; if no aur packages have been specified
