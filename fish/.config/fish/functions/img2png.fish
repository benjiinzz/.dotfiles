function img2png
    set img $argv[1]
    set rest $argv[2..]
    magick $img $rest -strip \
        -define png:compression-filter=5 \
        -define png:compression-level=9 \
        -define png:compression-strategy=1 \
        -define png:exclude-chunk=all \
        (string replace -r '\.[^.]+$' '' $img)-optimized.png
end
