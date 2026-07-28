set -g fish_user_paths "$HOME/bin"
set -g fish_user_paths $fish_user_paths "$HOME/.asdf/shims"

set -g fish_user_paths $fish_user_paths "/opt/local/bin"
set -g fish_user_paths $fish_user_paths "/opt/homebrew/bin"
set -g fish_user_paths $fish_user_paths "/opt/local/sbin"
set -g fish_user_paths $fish_user_paths "/opt/homebrew/sbin"

set -g fish_user_paths $fish_user_paths "/Applications/MacVim.app/Contents/bin"
set -g fish_user_paths $fish_user_paths "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

#set -l BREW_OPENSSL_PATH "/usr/local/opt/openssl"
#set -g fish_user_paths $fish_user_paths "$BREW_OPENSSL_PATH/bin"

#set -x LIBRARY_PATH "$BREW_OPENSSL_PATH/lib/" $LIBRARY_PATH
#set -x LDFLAGS "-L$BREW_OPENSSL_PATH/lib"
#set -x CPPFLAGS "-I$BREW_OPENSSL_PATH/include"

# maybe? from fish 4.3
# set --global fish_key_bindings fish_default_key_bindings

# from fish 4.3 theme parts, to FISHTHEME
# set --global fish_color_autosuggestion 555 brblack
# set --global fish_color_cancel -r
# set --global fish_color_command --bold
# set --global fish_color_comment red
# set --global fish_color_cwd green
# set --global fish_color_cwd_root red
# set --global fish_color_end brmagenta
# set --global fish_color_error brred
# set --global fish_color_escape bryellow --bold
# set --global fish_color_history_current --bold
# set --global fish_color_host normal
# set --global fish_color_host_remote yellow
# set --global fish_color_match --background=brblue
# set --global fish_color_normal normal
# set --global fish_color_operator bryellow
# set --global fish_color_param cyan
# set --global fish_color_quote yellow
# set --global fish_color_redirection brblue
# set --global fish_color_search_match white --background=brblack
# set --global fish_color_selection white --bold --background=brblack
# set --global fish_color_status red
# set --global fish_color_user brgreen
# set --global fish_color_valid_path --underline
# set --global fish_pager_color_completion
# set --global fish_pager_color_description B3A06D yellow
# set --global fish_pager_color_prefix white --bold --underline
# set --global fish_pager_color_progress brwhite --background=cyan
# set --global fish_pager_color_selected_background -r
# FISHTHEME end

set -x EDITOR vim

set -x GO111MODULE on

set -x KERL_CONFIGURE_OPTIONS "--disable-debug --without-javac"

# ssh-add --apple-use-keychain ~/.ssh/id_rsa
ssh-add --apple-use-keychain ~/.ssh/id_ed25519

alias ls='ls -FGh'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias less='less -RSX'
alias be='bundle exec'

alias dc=docker-compose
alias d=docker

function bi
  bundle config set --local path 'vendor/bundle'
  bundle install
end

function gof
  for f in $argv
    goimports -w $f
  end
end

function jdiff
  code --diff <(jq -S '.' $1) <(jq -S '.' $2)
end

function docker_rm_all
  docker ps -aq | xargs docker stop | xargs docker rm
  docker volume rm (docker volume ls -q)
end

function iso_to_img
  hdiutil convert -format UDRW -o $1.img $1
end

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

test (which direnv) ; and eval (direnv hook fish)
