# Define colors
color1="#2e3440"
color2="#3b4252"
color3="#434c53"
color4="#4c566a"


# symbols
arrow=$(printf '\uE0B0')
git_branch=$(printf '\uE0A0')


# functions
git_prompt_info() {
    local branch=$(git symbolic-ref --short HEAD 2>/dev/null)
    if [[ -n $branch ]]; then
        echo " ${git_branch} ${branch} "
    fi
}


# ------------------------------------------------
# prompt
# ------------------------------------------------
# enable prompt substitution
setopt PROMPT_SUBST

PROMPT="%B%K{${color1}}%D{%H:%M} %k"               # current time HH:MM
PROMPT+="%F{${color1}}%K{${color2}}${arrow}%f"
PROMPT+=' %n %k'                                   # current user
PROMPT+="%F{${color2}}%K{${color3}}${arrow}%f"
PROMPT+=' %~ %k'                                   # current directory
PROMPT+="%F{${color3}}%K{${color4}}${arrow}%f"
PROMPT+="\$(git_prompt_info)%k%f"                  # git branch (if in repo)
PROMPT+="%F{${color4}}${arrow}%f"
PROMPT+='%b %# '
