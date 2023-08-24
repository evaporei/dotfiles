set -gx PATH ~/bin $PATH
set -gx PATH ~/.cargo/bin $PATH
set -gx PATH ~/.local/bin $PATH
set -gx PATH (go env GOPATH)/bin $PATH

set QT_IM_MODULE fcitx
set XMODIFIERS @im=fcitx
set GTK_IM_MODULE fcitx

set GLFW_IM_MODULE ibus
set SDL_IM_MODULE fcitx

set -gx EDITOR (which nvim)

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# set -U fish_greeting ""
function fish_greeting
    cat $HOME/cat.txt
    echo "purr monster 怪獣猫" | vape
    # echo "Olá piranha"
end

# updates PATH for the Google Cloud SDK.
# if [ -f '/home/rei/google-cloud-sdk/path.fish.inc' ]; . '/home/rei/google-cloud-sdk/path.fish.inc'; end
