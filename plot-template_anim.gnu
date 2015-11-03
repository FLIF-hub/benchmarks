set terminal pngcairo size 1280,900
set output 'compression-anim-CATEGORY.png'

y1 = LOWER
y2 = UPPER
x1 = 0
x2 = NUMBER

set ytics 0.1
set grid ytics back
set grid xtics back
set key bottom right

set xlabel "images, sorted for each algorithm from best to worst relative compression"
set ylabel "relative size, compared to APNG (apngasm 2.7)"
set title  "Lossless animation compression comparison, corpus: CATEGORY (NUMBER images)"


plot [x1:x2][y1:y2]\
'<sort -n results/*anim.GIF.CATEGORY' using ($0):($1) with lines lw 3  lc rgb "#000088" lt 1 title "GIF",\
'<sort -n results/*anim.APNG.CATEGORY' using ($0):($1) with lines lw 2 lc rgb "#00FF00" lt 1 title "APNG",\
'<sort -n results/*anim.MNG.CATEGORY' using ($0):($1) with lines lw 1  lc rgb "#008800" lt 1 title "MNG",\
'<sort -n results/*anim.BPG.CATEGORY' using ($0):($1) with lines lw 1  lc rgb "#AA00AA" lt 1 title "BPG",\
'<sort -n results/*anim.WebP.CATEGORY' using ($0):($1) with lines lw 3 lc rgb "#00AAAA" lt 1 title "WebP",\
'<sort -n results/*anim.FLIF.CATEGORY' using ($0):($1) with lines lw 3 lc rgb "#880000" lt 1 title "FLIF",\
'<sort -n results/*anim.FLIF-n.CATEGORY' using ($0):($1) with lines lw 3 lc rgb "#DD2200" lt 1 title "FLIF -n"
