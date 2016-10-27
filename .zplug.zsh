function zzplug(){
    export ZPLUG_HOME="${ZDOTDIR:-$HOME}/.zplug"
    test -e $ZPLUG_HOME || git clone https://github.com/zplug/zplug $ZPLUG_HOME
    source ~/.zplug/init.zsh
}
zzplug
zplug "plugins/git",   from:oh-my-zsh
zplug "lib/spectrum", from:oh-my-zsh
zplug "mchav/with", as:command
zplug "mrowa44/emojify",  as:command
function zplug_end() {
    if ! zplug check --verbose; then
        zplug install
    fi
    zplug load --verbose
}
zplug_end
