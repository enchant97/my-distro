#
# ~/.config/fish/config.fish
#
set fish_greeting


## Prompt ##
if status --is-interactive
    fastfetch
    starship init fish | source
end
