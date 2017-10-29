#!/usr/bin/env python

import os
import praw


def get_date():
    process = os.popen('TZ=Australia/ACT date "+%A. %B %d, %Y"')
    preprocessed = process.read()
    process.close()
    return preprocessed.strip()


if __name__ == '__main__':
    reddit = praw.Reddit('bot1')
    subreddit = reddit.subreddit("makeconnections")
    title = 'Checkins! {}'.format(get_date())
    selftext = 'Welcome to [checkins](https://gist.githubusercontent.com/mrdrozdov/add5eb017cb4cf0fe6453f82d0b141df/raw/1ae8114f20291940c58f46c96240eff57f316ad0/checkins.txt)!'
    subreddit.submit(title, selftext=selftext)
