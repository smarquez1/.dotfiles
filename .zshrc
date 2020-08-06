# Get the system type: Linux/Darwin
SYSTEM_TYPE=$(uname -s)
# Load Decisiv configs
source ~/.decisivrc
# Access yarn global executables globally
export PATH="$PATH:`yarn global bin`"
# Vim is default editor
export EDITOR=nvim
export VISUAL=$EDITOR
# GPG
export GPG_TTY=$(tty)

# Macos specific
if [ "$SYSTEM_TYPE" = "Darwin" ]; then
  # Postgresql 9.6
  export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
  # Brew path
  export PATH="/usr/local/sbin:$PATH"
  # https://stackoverflow.com/questions/52941426/upgraded-to-macos-mojave-and-now-getting-error-in-rails-console
  export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
fi

# Input/output
#
# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS
# wait 10 seconds before really executing 'rm -rf *'
setopt RM_STAR_WAIT
# Switch cursor between beam and block depending on terminal Vim mode
BLOCK='\e[1 q'
BEAM='\e[5 q'
echo -ne $BEAM

function zle-line-init zle-keymap-select {
  if [[ $KEYMAP == vicmd ]] || [[ $1 = 'block' ]]; then
    echo -ne $BLOCK
  elif [[ $KEYMAP == main ]] || [[ $KEYMAP == viins ]] ||
       [[ $KEYMAP = '' ]] || [[ $1 = 'beam' ]]; then
    echo -ne $BEAM
  fi
}

zle -N zle-line-init
zle -N zle-keymap-select

# 10ms for key sequences
KEYTIMEOUT=1

# _fix_cursor() { echo -ne '\e[5 q' }
# precmd_functions+=(_fix_cursor)
# zle-line-finish() { echo -ne "\e[5 q" }
# Prompt for spelling correction of commands.
setopt CORRECT
# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

# vi mode
bindkey -v 

# --------------------
# Module configuration
# --------------------

# completion
#

# fix completions not working (once a day)
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

# input
#

# Append `../` to your input for each `.` you type after an initial `..`
zstyle ':zim:input' double-dot-expand yes

# zsh-syntax-highlighting
#

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets cursor root)

# ------------------
# Initialize modules
# ------------------

if [[ ${ZIM_HOME}/init.zsh -ot ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  # Update static initialization script if it's outdated, before sourcing it
  source ${ZIM_HOME}/zimfw.zsh init -q
fi

source ${ZIM_HOME}/init.zsh

# ------------------------------
# Post-init module configuration
# ------------------------------

#
# zsh-history-substring-search

# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Bind up and down keys
zmodload -F zsh/terminfo +p:terminfo

if [[ -n ${terminfo[kcuu1]} && -n ${terminfo[kcud1]} ]]; then
  bindkey ${terminfo[kcuu1]} history-substring-search-up
  bindkey ${terminfo[kcud1]} history-substring-search-down
fi

bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
