set terminal svg size 1280,900 background rgb 'white'
set output 'compression-still-CATEGORY-IMAGE-PSNR.svg'



set grid ytics back
set grid xtics back
set key bottom right


set title  "Lossy image compression comparison, corpus: CATEGORY, image: IMAGE"
set xlabel "bits per pixel"
set ylabel "PSNR (higher is better)"


#'<cat results/orig*still.FLIF.CATEGORY' using ($1*8/$7/$8):($3) with linespoints title "FLIF orig",\


plot [][] \
'<cat results/r_still.FLIF.CATEGORY*' using ($1*8/$7/$8):($3) with linespoints lw 2 title "FLIF 0.2rc19",\
'<cat results/*still.mozJPEG.CATEGORY*' using ($1*8/$7/$8):($3) with linespoints title "mozJPEG 3.0",\
'<cat results/*still.JPEG.CATEGORY*' using ($1*8/$7/$8):($3) with linespoints title "libJPEG",\
'<cat results/*still.WebP.CATEGORY*' using ($1*8/$7/$8):($3) with linespoints title "WebP 0.5",\
'<cat results/*still.WebPNL.CATEGORY*' using ($1*8/$7/$8):($3) with linespoints title "WebP near lossless",\
'<cat results/*still.PNG.CATEGORY*' using ($1*8/$7/$8):($3) with linespoints title "pngquant + optipng",\
'<cat results/*still.JXR.CATEGORY*' using ($1*8/$7/$8):($3) with linespoints title "JPEG XR",\
'<cat results/*still.JP2.CATEGORY*' using ($1*8/$7/$8):($3) with linespoints title "JPEG 2000"


#'<cat results_orig/r_still.FLIF.CATEGORY' using ($1*8/$7/$8):($3) with linespoints title "FLIF orig",\
#,\
'<cat results/*still.FLIF.CATEGORY' using ($1*8/$7/$8):($3) with lines lw 3 smooth mcsplines title "FLIF",\
'<cat results/*still.JPEG.CATEGORY' using ($1*8/$7/$8):($3) with lines lw 3 smooth mcsplines title "JPEG"


#'<sort -n results/*still.FLIF-N.CATEGORY' using ($1*8/$7/$8):($3) with points title "FLIF -N",\
