# lock time in seconds
LOCK_TIME=15

cmd_pre_lock() {
    # we can set variable there and later use it in cmd_post_lock
    ponymix is-muted; IS_WAS_MUTED=$?
    playerctl -s status | grep -q Playing; IS_WAS_PLAYING=$?

    ponymix mute > /dev/null
    playerctl -sa pause

    # example of how we can intercept internal variables
    # notify-send "TASK_SOLVE: $TASK_SOLVE"
    # TASK_TEXT="TASK_TEXT edited. sorry"
}

cmd_post_lock() {
    test "$IS_WAS_MUTED" -ne 0 && \
        ponymix unmute > /dev/null
    test "$IS_WAS_PLAYING" -eq 0 && \
        playerctl play
}
