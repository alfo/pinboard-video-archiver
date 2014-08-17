# Pinboard Video Archiver

Because Pinboard can't archive videos like it can normal things, here's a script you can run that will download and save all the videos you've bookmarked. It can do YouTube, Vimeo, Soundcloud, Dailymotion (yuck) and anything else that someone has made a [viddl-rb](https://github.com/rb2k/viddl-rb) plugin for.

## Install

Clone this into somewhere sensible (like your scripts directory) and install things

    $ git clone https://github.com/alfo/pinboard-video-archiver.git
    $ bundle install

Also, I highly recommend using aria2 as your downloader because it's faster than wget and curl. Install with Homebrew or from [here](http://aria2.sourceforge.net/).

    $ brew install aria2

## Configure

Now rename `example.config.rb` to `config.rb` and put your Pinboard username and password in it, as well as the path for your videos.

## Run

The first time you run it, the script will download all of your past bookmarks, so it'll take AGES. After then it just downloads new ones.

You can run it manually if you want:

    $ ruby /path/to/archiver.rb

Or with a cron job every day at exactly 03:53 by running `crontab -e` and adding

    53 3 * * * ruby /path/to/archiver.rb >/dev/null 2>&1
