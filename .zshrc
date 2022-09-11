source ~/.zsh-autocomplete/zsh-autocomplete.plugin.zsh
source ~/.git-prompt.sh
zstyle ':completion:*:*:git:*' script ~/.git-completion.bash
fpath=(~/.zsh $fpath)

#load colors
autoload colors && colors
for COLOR in RED GREEN YELLOW BLUE MAGENTA CYAN BLACK WHITE; do
    eval $COLOR='%{$fg_no_bold[${(L)COLOR}]%}'  #wrap colours between %{ %} to avoid weird gaps in autocomplete
    eval BOLD_$COLOR='%{$fg_bold[${(L)COLOR}]%}'
done
eval RESET='%{$reset_color%}'
export GIT_PS1_SHOWDIRTYSTATE=1
setopt PROMPT_SUBST ;
PS1='${RED}%n${GREEN}$(__git_ps1 " (%s)") ${BLUE}%c \$ ${RESET}'
source ~/.env_profile
