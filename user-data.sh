#!/bin/bash

sudo yum install git -y
git clone https://github.com/AshutoshJha786/sentry-migration.git /tmp/git

sudo sh sentry.sh
