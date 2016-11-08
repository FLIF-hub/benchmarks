set terminal svg size 1280,900 background rgb 'white'
set output 'compression-still-CATEGORY-IMAGE-DSSIM.svg'



set grid ytics back
set grid xtics back
set key top right

set logscale y

set title  "Lossy image compression comparison, corpus: CATEGORY, image: IMAGE"
set xlabel "bits per pixel"
set ylabel "DSSIM (lower is better)"



plot [0:10][0.00001:0.1]\
'<cat results/r_still.FLIF.CATEGORY* | grep -v 0.000000' using ($1*8/$7/$8):($2) with linespoints title "FLIF 0.2rc19",\
'<cat results/*still.mozJPEG.CATEGORY*' using ($1*8/$7/$8):($2) with linespoints title "MozJPEG 3.0",\
'<cat results/*still.JPEG.CATEGORY*' using ($1*8/$7/$8):($2) with linespoints title "libJPEG",\
'<cat results/*still.WebP.CATEGORY*' using ($1*8/$7/$8):($2) with linespoints title "WebP 0.5",\
'<cat results/*still.WebPNL.CATEGORY*' using ($1*8/$7/$8):($2) with linespoints title "WebP near lossless",\
'<cat results/*still.PNG.CATEGORY*' using ($1*8/$7/$8):($2) with linespoints title "pngquant+optipng",\
'<cat results/*still.JXR.CATEGORY*' using ($1*8/$7/$8):($2) with linespoints title "JPEG XR",\
'<cat results/*still.JP2.CATEGORY*' using ($1*8/$7/$8):($2) with linespoints title "JPEG 2000",\


#,\
'<cat results_orig/r_still.FLIF.CATEGORY | grep -v 0.000000' using ($1*8/$7/$8):($2) with linespoints title "FLIF orig",\
'<cat results/*still.FLIF.CATEGORY' using ($1*8/$7/$8):($2) with lines lw 3 smooth mcsplines title "FLIF",\
'<cat results/*still.JPEG.CATEGORY' using ($1*8/$7/$8):($2) with lines lw 3 smooth mcsplines title "JPEG"

