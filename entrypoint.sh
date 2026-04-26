#!/bin/bash
/usr/sbin/sshd
exec tail -f /dev/null
