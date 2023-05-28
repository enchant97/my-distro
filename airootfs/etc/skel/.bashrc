#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


## Prompt ##
fastfetch
eval "$(starship init bash)"


## EXPORTS ##
export PATH=~/.local/bin:$PATH
