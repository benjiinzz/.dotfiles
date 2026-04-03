function img2jpg-small
    set img $argv[1]
    set rest $argv[2..]
    magick $img $rest -resize '1080x>' -quality 95 -strip (string replace -r '\.[^.]+$' '' $img)-optimized.jpg
end
