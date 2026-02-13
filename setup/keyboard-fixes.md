# Enable keyboard after sleep

sudo vim /usr/lib/systemd/system-sleep/fix-keyboard

```bash
#!/bin/bash

case $1/$2 in
  post/*)
    echo "Reinitializing keyboard controller after resume" | systemd-cat -t fix-keyboard

    # Unbind and rebind i8042
    echo -n "i8042" > /sys/bus/platform/drivers/i8042/unbind 2>/dev/null
    sleep 0.5
    echo -n "i8042" > /sys/bus/platform/drivers/i8042/bind 2>/dev/null

    # Also try serio rescan
    echo -n "rescan" > /sys/bus/serio/devices/serio0/drvctl 2>/dev/null
    ;;
esac
```
sudo chmod +x /usr/lib/systemd/system-sleep/fix-keyboard

# Change copilot key to right control

```bash
sudo zypper install keyd
sudo mkdir -p /etc/keyd
sudo vim /etc/keyd/default.conf
```

Paste the following into the file to catch the Copilot shortcut and turn it into Right Control:

```text
[ids]
*

[main]
leftshift+leftmeta+f23 = rightcontrol
```
