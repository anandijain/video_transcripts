# transcripts of @the_runofff videos

https://www.youtube.com/channel/UCnKJ-ERcOd3wTpG7gA5OI_g
```sh
yt-dlp --flat-playlist --print "%(id)s" "https://www.youtube.com/channel/UCnKJ-ERcOd3wTpG7gA5OI_g/videos" > video_urls.txt
yt-dlp --flat-playlist --print "%(id)s" "https://www.youtube.com/channel/UCnKJ-ERcOd3wTpG7gA5OI_g/shorts" > shorts_urls.txt
yt-dlp --flat-playlist --print "%(id)s" "https://www.youtube.com/channel/UCnKJ-ERcOd3wTpG7gA5OI_g/streams" > streams_urls.txt
cat video_urls.txt shorts_urls.txt streams_urls.txt > all_urls.txt
yt-dlp --write-info-json --write-auto-subs --skip-download -a all_urls.txt
```

todo - just take some # of screenshots or even spaced duration for each video and have llm describe it 

so far i have streamed 872.880948176968 hours
