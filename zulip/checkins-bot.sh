#!/bin/sh

# Usage: sh checkins-bot.sh /path/to/cron-jobs almuni-checkins

CRON_DIR=$1
STREAM=$2

SUBJECT=`sh $CRON_DIR/checkins.sh`
# STREAM="alumni-checkins"

. $CRON_DIR/env.sh

ZCURL="curl -u $CHECKINS_BOT_EMAIL:$CHECKINS_BOT_API_KEY https://recurse.zulipchat.com/api/v1"

$ZCURL/messages \
  -d "type=stream" \
  -d "to=$STREAM" \
  -d "subject=$SUBJECT" \
  -d 'content=Welcome to [checkins](https://gist.githubusercontent.com/mrdrozdov/bfd8d218a9414ce11b4d/raw/a23ff8cf560ef6fa60893bade9d05c5fc7f12313/alumin-checkins.txt)!'
