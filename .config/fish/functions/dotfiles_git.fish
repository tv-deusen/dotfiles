function dotfiles_git --wraps='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME' --description 'alias dotfiles_git=/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
  /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $argv
        
end
