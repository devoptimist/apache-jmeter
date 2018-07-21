# Habitat package: jmeter

## Description

This plan habitaizes the jmeter 4.0 release, for use 
on the command line or as a gui application (needs an X windows
 enabled host system for the gui)


## Usage
If installed with a bin link, using the `-b`

```
hab pkg install -b devoptimist/apache-jmeter
```
then the bin wrapper apache-jmeter will be available on
the command line:
```
apache-jmeter <jmeter command> <command args>
```

the bin wrapper `apache-jmeter` just execs the jmeter commands
with the correct java home variable set (jre8)

```
apache-jmeter jmeter -n -t /tmp/test.jmx -l /tmp/log.jtl
```
