# perfectrestore
MikroTik config restore helper script

This script is designed to restore plain-text, export files created using the following command.

```
/export file=myrtrbackup
```

## Features

* **Introduces a delay** – This allows time for the router’s interfaces to initialize before running the import script.
* **Audible prompts** – Before and after beep sequences to tell you if the import was successful.
* **Logging to disk** – you can inspect perfectrestore.log.0.txt to see if the import was successful. This is useful if your router does not have a builtin speaker (some models don’t).

## Try it out

Copy both `perfectrestore.rsc` and `backup.rsc` to your router and run the following command.

```
/import flash/perfectrestore
```
The script has a pre and post delay of 15 seconds. Be close to your router to here the confirmation beeps and/or inspect the log file `perfectrestore.log.0.txt`

## Documentation
[https://jcutrer.com/howto/networking/mikrotik/perfectrestore-script](https://jcutrer.com/howto/networking/mikrotik/perfectrestore-script)
