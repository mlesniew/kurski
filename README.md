# kurski
Kurski is a bash script which allows to easily download videos from vod.tvp.pl.

## Usage

To download a single video, open the page with the video in your browser, copy the URL and run `kurski.sh` with the URL as the only argument.  For example, to download [this episode of Ranczo](https://vod.tvp.pl/video/ranczo,x-seria-odc-130,26773457) run:

```
./kurski.sh 'https://vod.tvp.pl/video/ranczo,x-seria-odc-130,26773457'
```

To download multiple videos, e.g. all episodes of your favourite series, open the series page in your browser and use the URL as the argument to `multikurski.sh`.  For example, to download [all seazon 1 episodes of Ranczo](https://vod.tvp.pl/website/ranczo,1667874/video?sezon=1667875), run:

```
./multikurski.sh 'https://vod.tvp.pl/website/ranczo,1667874/video?sezon=1667875'
```

Note that quoting the URLs is always a good idea.

## Requirements

All you need is *Bash*/*Dash* and a few common Linux utils (like `grep`, `tr`), `wget` and `curl`.

The scripts were tested with *Dash* on *Ubuntu 17.04* and *Raspbian*.
