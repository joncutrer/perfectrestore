#
# perfectrestore.rsc
# Version: 0.1.1
# Author: Jonathan Cutrer
# License: MIT
# Project: https://github.com/joncutrer/perfectrestore
#
 
{
 
:local targetfile "flash/backup.rsc"   
 
# Wait for interfaces to initialize
:delay 15s
 
# Beep Functions
 :local doStartBeep [:parse ":beep frequency=1000 length=300ms;:delay 150ms;:beep frequency=1500 length=300ms;"];
 :local doFinishBeep [:parse ":beep frequency=1000 length=.6;:delay .5s;:beep frequency=1600 length=.6;:delay .5s;:beep frequency=2100 length=.3;:delay .3s;:beep frequency=2500 length=.3;:delay .3s;:beep frequency=2400 length=1;
"];
 
# Setup temporary logging to disk
/system logging action add disk-file-count=1 disk-file-name=flash/perfectrestore.log disk-lines-per-file=4096 name=perfectrestore target=disk
/system logging add action=perfectrestore topics=system,info
/system logging add action=perfectrestore topics=script,info
/system logging add action=perfectrestore topics=warning
/system logging add action=perfectrestore topics=error
/system logging add action=perfectrestore topics=critical
/system logging add action=perfectrestore topics=debug
 
# Play Audible Start Sequence
$doStartBeep
 
# Import the rsc file
:log info "BEGIN IMPORT file=$targetfile"
import $targetfile
:log info "END IMPORT file=$targetfile"
 
# Post import delay
:delay 10s
 
# Play Audible Finish Sequence
$doFinishBeep
 
# Teardown temporary logging to disk
/system logging remove [/system logging find where action=perfectrestore]
/system logging action remove [/system logging action find where name=perfectrestore] 
 
}