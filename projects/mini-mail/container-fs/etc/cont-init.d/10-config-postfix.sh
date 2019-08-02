#!/usr/bin/env bash

set -x

MAILDOMAIN="${MAILDOMAIN:-"example.org"}"

postconf -e myhostname="${MAILDOMAIN}"
postconf -e "mydestination = ${MAILDOMAIN}, ${HOSTNAME}, localhost.localdomain, localhost"
postconf -e 'smtpd_sasl_type = dovecot'
postconf -e 'smtpd_sasl_auth_enable = yes'
postconf -e 'smtpd_recipient_restrictions = permit_sasl_authenticated,permit_mynetworks'
postconf -e 'smtpd_sasl_path = private/auth'
postconf -e message_size_limit="${MESSAGE_SIZE_LIMIT:-52428800}"
