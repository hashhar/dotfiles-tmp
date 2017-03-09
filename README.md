# Dotfiles

This is my dotfiles repository managed by [GNU Stow][].

## Introduction

I started from scratch once again by installing [Linux From Scratch][] to get a
good idea of how Linux actually works. It was a valuable experience and I can't
recommend it enough.  Everybody should try it atleast once, you can even do it
on a VM.

I then moved on to [ArchLinux][] to get a lean and mean rolling-release system.
I also considered [NixOS][] and found it really innovative but haven't moved it
from a VM to a bare metal installation yet.

## Setup

1. Install GNU Stow. Most distributions package it under the name `stow`.
2. Clone my repository. `git clone https://github.com/hashhar/dotfiles.git
   ~/dotfiles`.
3. Individually install the dotfile sets that you want using `stow -R
   dotfile-set`. `dotfile-set` is simply the name of any directory in the
   repository.

I'll be providing a bootstrapping strip in due course of time. In the meantime I
recommend you read [this][Xero's GNU Stow Guide] to get a good idea of how GNU
Stow works and how to use it to manage your dotfiles.

## Questions? Suggestions? Ideas?

Open an issue or tweet me at [@hashhar][Twitter]. I can also be found lurking in
a lot of IRC channels. I'll add a list soon.

[GNU Stow]: https://www.gnu.org/software/stow
[Linux From Scratch]: http://linuxfromscratch.org
[ArchLinux]: https://www.archlinux.org
[NixOS]: https://nixos.org
[Xero's GNU Stow Guide]: http://blog.xero.nu/managing_dotfiles_with_gnu_stow
[Twitter]: https://twitter.com/hashhar

# vim: tw=80:
