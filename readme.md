# .dotfiles

# PDE
At the start of University, I got drawn into the rabit hole of Vim.<br>
Later discovering NeoVim, and went all in. It began my journey with setting up, 
my PDE, Personal Development Enviroment, I have always like to tinker with tech,
and this have been my passion for the past couple months; Mastering the Development
Workflow. This took alot of inspiration from people like Prime, TJ, Chris, and many more.

# What this contains

## ./bin
Many of my own script, notably rebuilding [my nixos](https://github.com/DHSYan/nixos), changing directory via
fuzzy finding, establishing a new obsidian vault, running c files, 
setting wallpaper via fuzzy find, sync-push and sync-pull from remote git 
repos to sync folders like my notes, .dotfiles, [dwm](https://github.com/DHSYan/dwm) and nixos config.


## ./latex-template
As a Math and CS student, Latex is probably one of the best tool you have in
your arsenal. I have templates for my lab reports and the occasional note 
taking.

## ./keyboard
Just some keyboard files that contains my Dactyl layout.

## ./nvim
The thing that started this whole thing.
Pulling alot of inspiration from ThePrimeagen. <br>
I crafted my NeoVim to cater what a Student might need. 
I didn't make any of the plugins that I used. They are all from github.

## ./obsidian
I use [obsidian to take notes](https://youtu.be/aIoEQC7w_UI?si=Eg_a7PG9J46pzIcw). 
This is my obsidian config, everything from theme, to hotkeys and plugins are 
here.


# Todos
- [ ] TODO: Clean up `./bin` directory, it has many deprecated files.
- [x] Change Vim clipboard register?
- [x] Better Remaps
- [ ] Fugititive learning
- [x] Obsidian.nvim when [[]] in notes, don't have it use id as filename.
- [x] Update this readme
- [ ] Have obsidian or obsidian.nvim automatically tag new docs when they are 
      created inside a file. Basically, inherit backlink's tag
- [ ] Create a better backup system

- [ ] create a hint displayed via the prompt that tells you if you have a 
background text.
- [ ] create a macro or keybind that CDs to the current directory that oil is looking at, the 
     the current's buffer root directory

<!-- #### DWM TODO -->
<!-- - [x] better dwm bar or rice dwm in general? -->
<!-- - [x] make window manager rules for wezterm, google browser. -->
<!-- - [ ] Screen Lock? -->

#### Nixos TODO
- [x] fonts
- [ ] Notification Daemon?
- [ ] Media Key support?
<!-- - [ ] How to configure multiple screen with startx? -->
- [ ] Learn how to setup a cron job in NIXOS
- [ ] Everytime I run cd, try to evaulate if there's a flake.nix, if there are run 
`nix develop` in it directory


# Other

