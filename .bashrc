__hotoku_source_if_exists(){
    path=$1
    [ -f ${path} ] && source ${path}
}

__hotoku_source_if_exists ~/.fzf.bash
__hotoku_source_if_exists /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc
__hotoku_source_if_exists /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc

unset -f __hotoku_source_if_exists
