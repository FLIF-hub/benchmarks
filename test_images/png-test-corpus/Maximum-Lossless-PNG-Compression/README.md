##Maximum PNG Compression - TJW Method

[TheJaredWilcurt](http://github.com/TheJaredWilcurt) developed the following recipe for reliably maximum lossless png compression. This method comes from years of constant tweaking and testing.

1. Run your png(s) through [PngOptimizer](http://psydk.org/PngOptimizer), it's pretty fast and does a good job. [My settings](http://imgur.com/eLXcMD3).
2. Then run them through [PNGOUTWin](http://www.ardfry.com/pngoutwin), this will take longer but does a good job of finding ways to compress pngs other algorithms won't. [My settings](http://imgur.com/QG2qI5m).
3. Run them through [PNGGauntlet](http://pnggauntlet.com). Since it's using [DeflOpt](http://www.walbeehm.com/download), PNGGauntlet can't be ran before PngOptimizer or PNGOUTWin, or it will prevent them from doing the maximum compression they could otherwise do. [My Settings](http://imgur.com/jzjp4hD).
4. Now run it in [ZopfliPNG](https://github.com/imagemin/zopflipng-bin/tree/master/vendor) with it set to 1000 randomized brute-force iterations. This will by far take the longest amount of time. My specific settings: `zopflipng --iterations=1000 --splitting=3 --filters=01234mepb --lossy_transparent file.png file.zopfli.png`
5. Then run them through [PNGOUTWin](http://www.ardfry.com/pngoutwin), again.
6. Run them through [PNGGauntlet](http://pnggauntlet.com) again.
7. Finally run [defluff](http://encode.ru/threads/1214-defluff-a-deflate-huffman-optimizer) then DeflOpt then defluff again. This typically take less than 1 second to run each.

With the exception of step 4, you should only overwrite your current file if the new version is the same or smaller size. If Zopfli produces a larger file, it will still be smaller by step 7 than what you had on Step 3.
