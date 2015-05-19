# dynamic-colors

This is a small tool for changing your terminal colors on the fly. This fork supports reading Xcolor style files. 

Most work accomplished by (sos4nt)[https://github.com/sos4nt/dynamic-colors] who did the original version which had a custom theme format.

## Pre-requisites

Your terminal must support the appropriate OSC escape sequences. xterm and urxvt (rxvt-unicode) work fine, whereas Terminal.app and iTerm won't recognize these sequences.

Make sure `dynamicColors` is enabled in `.Xdefaults`/`.Xresources`

    xterm*dynamicColors: true
    urxvt*dynamicColors: on

### Compatibility Check

This changes your terminal background color to red if your terminal supports OCS:

    echo -e "\033]11;#ff0000\007"


## Setup

1. Clone the repository into `~/.dynamic-colors`:

        git clone https://github.com/sos4nt/dynamic-colors ~/.dynamic-colors

2. To add the tool to your `PATH` put the following line in your profile (`.bashrc`/`.zshrc`/`.profile`).

        export PATH="$HOME/.dynamic-colors/bin:$PATH"

3. If you have a directory where you keep your Xcolor themes, define in in your `PATH` too (by default they are read from `~/.dynamic-colors/schemes/`):

        export DYNAMIC_COLORS_THEMES=~/.custom/xcolors/here/

4. For autocompletion add this to your profile (`.bashrc`/`.zshrc`/`.profile`). Change .zsh to .bash for bash environments.

        source $HOME/.dynamic-colors/completions/dynamic-colors.zsh


## Usage

List available color schemes:

    dynamic-colors list

Switch to a color scheme:

    dynamic-colors switch visibone

Switch to a next/previous scheme:

    dynamic-colors next/previous

Reload last color scheme:

    dynamic-colors init

Add this line to your profile to always set the last color scheme.

## Notes

This repository comes with just one Xcolor file for testing purposes.

## Notification

If you have ``notify-send-user`` the script will notify you of the name of the scheme you switched to.

## Key binding example for urxvt
Save this to a file named "urxvt-colors" most likely in `~/.urxvt/ext/share/`:

    sub on_user_command {
        my ($self, $cmd) = @_;

		    if ($cmd eq 'urxvt-colors:next') {
          $self->cmd_parse(`dynamic-colors next`);
		    }

		    if ($cmd eq 'urxvt-colors:previous') {
          $self->cmd_parse(`dynamic-colors previous`);
		    }
    }

Add this to ~/.Xdefaults:

    urxvt*perl-ext-common: urxvt-colors
    urxvt*perl-lib: [directoy of urxvt-colors]
    urxvt.keysym.M-F11: perl:urxvt-colors:next
    urxvt.keysym.M-F12: perl:urxvt-colors:previous

Now you can cycle through all color schemes using Alt+F11/12 for example, without closing running console applications.
