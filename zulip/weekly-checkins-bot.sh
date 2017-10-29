#!/bin/sh

# Usage: sh checkins-bot.sh /path/to/cron-jobs almuni-checkins

CRON_DIR=$1
STREAM=$2

SUBJECT=`sh $CRON_DIR/weekly-checkins.sh`
# STREAM="alumni-checkins"

. $CRON_DIR/env.sh

ZCURL="curl -u $CHECKINS_BOT_EMAIL:$CHECKINS_BOT_API_KEY https://recurse.zulipchat.com/api/v1"

$ZCURL/messages \
  -d "type=stream" \
  -d "to=$STREAM" \
  -d "subject=$SUBJECT" \
  -d 'content=Welcome to [weekly checkins](https://gist.githubusercontent.com/mrdrozdov/1a2805eb870f14a312f7/raw/9f5f53aeef93467dcb30055e7fb02f35af390bf2/weekly-checkins.txt)!'
