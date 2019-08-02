#!/usr/bin/env bash
useradd -m -G mail -p "$(mkpasswd opennms2pass)" "opennms"
touch /var/mail/opennms
chown user1:mail /var/mail/opennms

useradd -m -G mail -p "$(mkpasswd user1pass)" "user1"
touch /var/mail/user1
chown user1:mail /var/mail/user1

useradd -m -G mail -p "$(mkpasswd user2pass)" "user2"
touch /var/mail/user2
chown user1:mail /var/mail/user2
