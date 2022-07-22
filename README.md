# dynamic-motd

Dynamic MOTD for Linux Servers

##  Sample Output

```
--- GOOD morning root ----

===========================================================================
 -- Hostname............:  [Redacted] 
 -- IP Address..........:  [Redacted]
 -- Release.............:  Amazon Linux 2 
 -- Users...............:  Currently 1 user(s) logged on 
=========================================================================== 
 -- Current user........:  root 
 -- CPU usage...........:  0.00 - 0.01 - 0.10 (1-5-15 min) 
 -- Memory used.........:  965 - 102 - 374 (total-free-used) 
 -- Processes...........:  98 running 
 -- System uptime.......:  0 days 20 hours 47 minutes 54 seconds 
 -- Disk space ROOT.....:  5.9G remaining 
===========================================================================
```

## Installation

- Clone Repo
- Copy/Move dynamotd.sh to /etc/profile.d/dynamotd.sh

## Options

- Possibility to have a ASCII font display a message of your choosing (look at line 36), but you will need to install figlet
- Possibility to have a fortune read to you by Tux (look at line 37/38), but you will need to install cowsay and fortune
