[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"zsk

# ----- plugins -----
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ----- global theme -----
export THEME="$(cat ~/.config/theme/mode 2>/dev/null || echo dark)"

# ----- zsh autosuggestion rememeber-----
setopt APPEND_HISTORY
setopt SHARE_HISTORY
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY

# ----- highlight groups -----
ZSH_HIGHLIGHT_STYLES[precommand]='fg=#dc8a78'
ZSH_HIGHLIGHT_STYLES[path]='none'
ZSH_HIGHLIGHT_STYLES[path_prefix]='none'
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=245'

export EDITOR=nvim

# ----- starship -----
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

if [[ "$THEME" == "dark" ]]; then
  export STARSHIP_THEME="dark"
else
  export STARSHIP_THEME="light"
fi

# ----- yazi -----
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# ----- bat -----
export BAT_THEME=Shadow

# ----- eza -----
export EZA_CONFIG_DIR="$HOME/.config/eza"
alias ls="eza -a --color=always --icons=always -l --git"

# ----- FZF -----
# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git "
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

export FZF_DEFAULT_OPTS="
  --preview '[[ -d {} ]] && eza --icons=always --tree --color=always {} | head -200 || bat --color=always -n --line-range :500 {}'
  --layout=default --border --style=full
  --color=bg+:#252525,bg:#0f0f0f,spinner:#9c9c9c,hl:#5f5f5f
  --color=fg:#f5f5f5,header:#e8e8e8,info:#ffffff,pointer:#e8e8e8
  --color=marker:#ffffff,fg+:#e8e8e8,prompt:#ffffff,hl+:#5f5f5f
  --color=selected-bg:#0f0f0f
  --color=border:#5f5f5f,label:#e8e8e8"

# Setup fzf previews
export FZF_CTRL_T_OPTS="--preview 'bat --color=always -n --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --icons=always --tree --color=always {} | head -200'"

# fzf preview for tmux
export FZF_TMUX_OPTS=" -p90%,70% " 

# FIX fzf ALT C on MACOS
bindkey "ç" fzf-cd-widget

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

# fzf git
source ~/fzf-git.sh/fzf-git.sh

# f to open full fzf with nvim integration
f() {
  local selection
  selection=$(fd . --hidden --exclude .git --color=always | fzf --ansi) || return

  if [[ -d "$selection" ]]; then
    cd "$selection"
    echo "📁 Changed directory to: $selection"
  else
    nvim "$selection"
  fi
}

# ----- zoxide (better cd) -----
eval "$(zoxide init zsh)"

# ----- hyprshot -----
export HYPRSHOT_DIR="$HOME/Pictures/Screenshots"

# ----- dotnet -----
export PATH="$PATH:/home/amin/.dotnet/tools"
export PATH="$HOME/.local/bin/netcoredbg:$PATH"

# ----- alias -----
alias c="clear && printf '\e[3J'"

alias vim="nvim"
alias v="nvim"

alias e="exit"
alias cd="z"

alias cm="cmatrix -ba -u 2 -C black"
