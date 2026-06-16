function ssh-agent-start
    set -gx SSH_AUTH_SOCK $HOME/.ssh/ssh-agent.sock
    if not pgrep -u $USER ssh-agent > /dev/null
        ssh-agent -a $SSH_AUTH_SOCK > /dev/null
    end
    ssh-add ~/.ssh/id_ed25519 2>/dev/null
    ssh-add ~/.ssh/id_github 2>/dev/null
end
