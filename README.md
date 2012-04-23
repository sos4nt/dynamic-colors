# dynamic-colors

This is a small tool for changing terminal colors 0-15 on the fly.

I use it to switch my entire [tmux](http://tmux.sourceforge.net/) session between [Solarized](http://ethanschoonover.com/solarized) dark and light modes.


## Pre-requisites

Your terminal must support OSC escape sequences. Real terminals like xterm and urxvt work fine, whereas terminal emulators like Terminal.app or iTerm fall short.

Make sure `dynamicColors` is enabled in `.Xdefaults`/`.Xresources`

    xterm*dynamicColors: true
    urxvt*dynamicColors: on

### Compatibility Check

This gives a red background if your terminal supports OCS:

    echo -e "\033]11;#ff0000\007"


## Setup

1. Clone the repository into `~/.dynamic-colors`:

        git clone https://github.com/sos4nt/dynamic-colors ~/.dynamic-colors

2. To add the tool to your `PATH` put the following line in your profile (`.bashrc`/`.zshrc`/`.profile`).

        export PATH="$HOME/.dynamic-colors:$PATH"


## Usage

List available color schemes:

    dynamic-colors list

Switch to a color scheme:

    dynamic-colors switch solarized-dark

### Integration

I'm using the provided color schemes in conjunction with [dircolors-solarized](https://github.com/seebi/dircolors-solarized) and [vim-colors-solarized](https://github.com/altercation/vim-colors-solarized) for best results. Always use the dark mode and switch schemes with `dynamic-colors switch <colorscheme>`


## Developing color schemes

Create a new color scheme (will be opened in your default editor):

    dynamic-colors create my-color-scheme

Edit an exising color scheme:

    dynamic-colors edit my-color-scheme

Check if all colors are defined:

    dynamic-colors audit my-color-scheme

