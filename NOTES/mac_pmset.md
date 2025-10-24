# Schedule mac to power on daily at 8:30AM and shutdown 6:30PM daily

```
sudo pmset -g sched
sudo pmset repeat wakeorpoweron MTWRFSU 08:30:00: shutdown MTWRFSU 18:30:00:
sudo pmset -g sched
```

# Get rid of the schedule

```
sudo pmset repeat cancel
```
