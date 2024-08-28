if [ -r ~/.zshrc -a -r ~/.zshrc.global -a ! -r ~/.zshrc.local ] ; then
    printf '-!-\n'
    printf '-!- Looks like you are using the old zshrc layout of grml.\n'
    printf '-!- Please read the notes in the grml-zsh-refcard, being'
    printf '-!- available at: http://grml.org/zsh/\n'
    printf '-!-\n'
    printf '-!- If you just want to get rid of this warning message execute:\n'
    printf '-!-        touch ~/.zshrc.local\n'
    printf '-!-\n'
fi

## changed completer settings
zstyle ':completion:*' completer _complete _correct # _approximate
zstyle ':completion:*' expand prefix suffix

## another different completer setting: expand shell aliases
# zstyle ':completion:*' completer _expand_alias _complete _approximate
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

## global aliases (for those who like them) ##

alias ..='cd ..'
alias -g '...'='../..'
alias -g '....'='../../..'

## END OF DEFAULT #################################################################
source ~/.zshrc.local
# load .zshrc.$HOST if it exists
[ -f ~/.zshrc.$HOST ] && source ~/.zshrc.$HOST

export HISTFILE=~/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY
#eval "$(keychain --eval --quiet --noask id_ed25519)"

#export GPG_TTY=$(tty) Created by newuser for 5.9

# pnpm
export PNPM_HOME="/home/uPiscium/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
