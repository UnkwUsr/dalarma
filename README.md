# dalarma

`dalarma` is a simple, but powerful cli tool for setting timers, which, after
timeout, will block your screen (by default for 15 seconds) to force you to get
up from the computer and do some thing.

### Why would I want to block my screen and force me for anything?

Imagine you cooking something in oven, and you need to wait for 1 hour until it
is done. If you seat at computer, you can very easily miss the time and then
your food is crapped. With `dalarma` you can set timer for 1 hour, which after
expiring will block your screen (for 15 seconds), so you have to get up and
check oven.

### Why no way for easy skip/postpone?

When you do really interesting task and have some experience with such timers,
you actually getting training yourself to automatically/mindlessly
postpone/skip another one timer alarm, thinking like "ahgh, I'm almost finished
this fancy algorithm, let me just done it in 2 minutes and I'll check these
oven", which can result in many postpones in a row, so you know what will
happen with your food in oven...

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
there is available suffixes like `s`, `m`, `h` for seconds, minutes and hours
respectively.

Additionally, first argument time can be set in format `hh:mm` to set timer ON
TIME, not by offset.

All remaining arguments will be used as title for your timer.

```
dalarma 30m check oven
```

```
dalarma 14:20 time to depart
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

## Inspiration

Spiritual successor of <https://github.com/UnkwUsr/UsefulB> , which was first
inspired by <https://github.com/slgobinath/SafeEyes>
