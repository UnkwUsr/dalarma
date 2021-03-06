# dalarma
`dalarma` is a simple, but powerful cli tool for setting timer, which, after
timeout, will block your screen to force you to get up from the computer and do
some thing.

## Requirements
* `i3wm` (because of `i3-msg`) - window manager (thanks to `i3-msg`'s feature
  to monitor windows events and set fullscreen and sticky mode from cli).
  Possible can be dropped by using `wmctrl`.
* `st` (possible alternatives) - simple/suckless terminal, it used as gui that
  block screen.
* `notify-send` (optional) - for sending notifies visible on blocked screen.

## Installation
Just copy
[./dalarma](https://raw.githubusercontent.com/UnkwUsr/dalarma/master/dalarma)
somewhere to your `~/.local/bin/` and
[./config.example.sh](https://raw.githubusercontent.com/UnkwUsr/dalarma/master/config.example.sh)
to `~/.config/dalarma/config.sh`.

## Usage
First argument is always the time after which "you need to do something". Format is
the same as for `sleep`, so go to `man sleep` for details. In short: there is
available suffixes like `s`, `m`, `h`.

All remaining arguments will be used as title for your timer.
```
dalarma 5m drink water
```

## Configuration
`~/.config/dalarma/config.sh` is just a shell script that executes on start of
`dalarma` (so it can be very hackable and extensible). As interesting feature,
you can execute your own commands before and after lock (like mute/unmute all sounds,
etc.) with `cmd_pre_lock` and `cmd_post_lock`.

Self-explanatory [config example](./config.example.sh) provided.
