# transcripts of @the_runofff videos

channel id 
https://www.youtube.com/channel/UCnKJ-ERcOd3wTpG7gA5OI_g

test vide
https://www.youtube.com/watch?v=K2OsuCs2YrE


```sh
yt-dlp --flat-playlist --print "%(id)s" "https://www.youtube.com/channel/UCnKJ-ERcOd3wTpG7gA5OI_g/videos" > video_urls.txt
yt-dlp --flat-playlist --print "%(id)s" "https://www.youtube.com/channel/UCnKJ-ERcOd3wTpG7gA5OI_g/shorts" > shorts_urls.txt
yt-dlp --flat-playlist --print "%(id)s" "https://www.youtube.com/channel/UCnKJ-ERcOd3wTpG7gA5OI_g/streams" > streams_urls.txt
cat video_urls.txt shorts_urls.txt streams_urls.txt > all_urls.txt
yt-dlp --write-info-json --write-auto-subs --skip-download -a all_urls.txt
```


yt-dlp --write-auto-sub --sub-lang en --skip-download --sub-format json3 "https://www.youtube.com/watch?v=K2OsuCs2YrE"
yt-dlp --sub-format json3 --write-auto-subs --skip-download -a data/urls/all_urls.txt

todo - just take some # of screenshots or even spaced duration for each video and have llm describe it 

so far i have streamed 872.880948176968 hours

# todo 
* list which videos are missing vtt/json3 transcripts 
* add global timestamps to my words for live vids by offseting the transcripts by the live start time 
    * would give me a way to easily find what words i said on a given day 
* do the tally on just the utf8s in the segs without join + tokenize 
* compare with word freqs to charactize how i talk 
* add another render where you have timestamps only on events not individual segments 
* start getting this updated daily 
* summarize with screenshots using gpt api