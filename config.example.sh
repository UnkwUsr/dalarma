# lock time in seconds
LOCK_TIME=15

# this function will run before locking
cmd_pre_lock() {
    # P.S. we can even set variables here and access them later in
    # cmd_post_lock. For example to save something before lock and revert it
    # back after

    # example: mute sound with saving its previous state
    ponymix is-muted; IS_WAS_MUTED=$?
    ponymix mute > /dev/null

    # example: pause current playing media players (via MPRIS interface) with
    # saving its previous state
    playerctl -s status | grep -q Playing; IS_WAS_PLAYING=$?
    playerctl -sa pause

    # example of how we can intercept internal variables
    # notify-send "TASK_SOLVE: $TASK_SOLVE"
    # TASK_TEXT="TASK_TEXT edited. sorry"
}

# this function will run after UN-locking
cmd_post_lock() {
    # unmute sound (if it was not muted before)
    test "$IS_WAS_MUTED" -ne 0 && \
        ponymix unmute > /dev/null
    # play media player (if any was playing before)
    test "$IS_WAS_PLAYING" -eq 0 && \
        playerctl play
}
