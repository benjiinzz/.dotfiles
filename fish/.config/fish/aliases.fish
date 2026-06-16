# File system
if command -v eza &> /dev/null
    alias ls='eza -lh --group-directories-first --icons=auto'
    alias lsa='ls -a'
    alias lt='eza --tree --level=2 --long --icons --git'
    alias lta='lt -a'
end

alias ff="fzf --preview 'bat --style=numbers --color=always {}'"

# Initiate zoxide

zoxide init fish | source

alias cd='z'

# Directories
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Compression
alias decompress='tar -xzf'

# Tools
alias d='docker'

#Git
alias g='git'
alias gs='git status'
alias gcm='git commit -m'
alias gcam='git commit -a -m'
alias gcad='git commit -a --amend'

alias hbup='sudo hb-up'

alias bns='sudo rm -rf release && docker build -t stb-hmi-builder -f Dockerfile.build . && docker run --rm -v "$(pwd)/release:/build/release" stb-hmi-builder && rsync -avz --delete release/0.5.0/linux-unpacked/ textile@192.168.31.21:~/bloomhmi/ && ssh textile@192.168.31.21 "sudo reboot"'
