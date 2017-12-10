Simple Youtube-dl 
===================
This is a short script I wrote so that I would not have to tediously write out youtube-dl's arguments every time I wanted to download a song. Automating tedious things is one of the bests reasons to write a program!

After I learned my first programming language, C++, I took a class on perl. I enjoyed it and this was the first perl script I wrote which wasn't homework. I was particularly proud of myself for finding and learning how to use **CPAN** (now I use [cpanm](http://search.cpan.org/~miyagawa/App-cpanminus-1.7040/bin/cpanm)).

I uploaded this because I will want to use it on other machines in the future and since github is in the cloud, I don't have to worry about losing this script now. 

**It is in the cloud, IT IS NOW ETERNAL**

## Don't use this script

Downloading videos from YouTube and extracting just the audio segment is easy with plain youtube-dl:

```bash
youtube-dl -x [url]
```

__-x__ extracts the audio. Output format may be specified, but if you can't tell the difference between different audio formats, then who cares?
