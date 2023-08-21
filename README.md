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

Just copy [./dalarma](./dalarma) somewhere to your `~/.local/bin/` and
[./config.example.sh](./config.example.sh) to `~/.config/dalarma/config.sh`.

## Usage

First argument is always the time after which "you need to do something".
Format is the same as for `sleep`, so go to `man sleep` for details. In short:
there is available suffixes like `s`, `m`, `h`.

All remaining arguments will be used as title for your timer.

```
dalarma 5m drink water
```

### Managing timers

`dalarma` puts each new timer metadata to `/tmp/dalarma/` folder, one per file.
File name is pid of timer process, and file itself contains metadata about this
timer, such as `started_at`, `sleep_time` and `title`.

There is [script](./helper_scripts/fdalarma) that also utilizes fzf for ui. You
can take inspiration from it.

## Configuration

`~/.config/dalarma/config.sh` is just a shell script, so it can be very
hackable and extensible.

As interesting feature, you can execute your own commands before and after lock
(like mute/unmute all sounds, etc.) with `cmd_pre_lock` and `cmd_post_lock`.

You can edit it even after some timers have started and they will use updated
config (for example, edit pre and post hooks).

Self-explanatory [config example](./config.example.sh) provided.
