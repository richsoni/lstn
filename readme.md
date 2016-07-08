#LSTN: Lil' Song Terminal/Tmux Notification

# Installation

```
$ curl https://raw.githubusercontent.com/richsoni/lstn/master/lstn > ~/bin/lstn
$ chmod +x ~/bin/lstn
```

# Requirements

* mpc, for displaying mpd status
* ruby

# Usage
## Basic

Just run the script, and it will show Artist - Song playing in Spotify, iTunes, or MPD.

```
$ lstn
Neil Young - Drive Back
```

## Tmux Banner

add something like this to your `.tmux.conf` file.

```
set -g status-left '#[fg=yellow](#S)#[fg=green] #(lstn)'
```

