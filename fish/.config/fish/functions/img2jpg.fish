function img2jpg
    set img $argv[1]
    set rest $argv[2..]
    magick $img $rest -quality 95 -strip (string replace -r '\.[^.]+$' '' $img)-optimized.jpg
end
