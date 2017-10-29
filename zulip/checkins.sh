#!/bin/sh
DAY="$(TZ=Australia/ACT date "+%m/%d/%y")"
WEEK="$(TZ=Australia/ACT date "+%W")"
HEADER="Week $WEEK ($DAY)"
echo Checkins! $HEADER
