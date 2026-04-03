function compress
    tar -czf (string replace -r '/$' '' $argv[1]).tar.gz (string replace -r '/$' '' $argv[1])
end
