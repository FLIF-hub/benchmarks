#set terminal pngcairo size 1280,900 dashed
set terminal pngcairo size 1280,900
set output 'compression-still-CATEGORY.png'

y1 = 0.4
y2 = 1.4
x1 = 0
x2 = NUMBER

set ytics 0.1
set grid ytics back
set grid xtics back
set key bottom right

set xlabel "images"
set ylabel "relative size of compressed file (smaller is better)"
set title  "Image corpus: CATEGORY (NUMBER images)"


plot [x1:x2][y1:y2]\
'<sort -n results/*still.JP2.CATEGORY' using ($0):($1) with linespoints lw 3  lc rgb "#000088" lt 1 title "lossless JPEG 2000",\
'<sort -n results/*still.JXR.CATEGORY' using ($0):($1) with linespoints lw 3  lc rgb "#888800" lt 3 title "lossless JXR (alpha dropped)",\
'<sort -n results/*still.JPEG.CATEGORY' using ($0):($1) with linespoints lw 3  lc rgb "#FFFF00" lt 3 title "lossy JPEG -quality 100 (alpha dropped)",\
'<sort -n results/*still.PNG-Adam7.CATEGORY' using ($0):($1) with linespoints lw 2 lc rgb "#00FF00" lt 1 title "PNG, Adam7 interlacing",\
'<sort -n results/*still.PNG.CATEGORY' using ($0):($1) with linespoints lw 3  lc rgb "#008800" lt 1 title "PNG (convert -quality 95, reference)",\
'<sort -n results/*still.optiPNG-Adam7.CATEGORY' using ($0):($1) with linespoints lw 2 lc rgb "#00FF00" lt 2 title "PNG, Adam7, optipng -o7",\
'<sort -n results/*still.optiPNG.CATEGORY' using ($0):($1) with linespoints lw 2 lc rgb "#008800" lt 2 title "PNG, optipng -o7",\
'<sort -n results/*still.BPG.CATEGORY' using ($0):($1) with linespoints lw 2  lc rgb "#AA00AA" lt 1 title "BPG -lossless -m 9",\
'<sort -n results/*still.WebP.CATEGORY' using ($0):($1) with linespoints lw 3 lc rgb "#00AAAA" lt 1 title "WebP -lossless -m 6",\
'<sort -n results/*still.FLIF-n.CATEGORY' using ($0):($1) with linespoints lw 3 lc rgb "#DD2200" lt 1 title "FLIF -n",\
'<sort -n results/*still.FLIF.CATEGORY' using ($0):($1) with linespoints lw 3 lc rgb "#880000" lt 1 title "FLIF"

