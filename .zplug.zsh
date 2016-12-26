function zzplug(){
    export ZPLUG_HOME="${ZDOTDIR:-$HOME}/.zplug"
    test -e $ZPLUG_HOME || git clone https://github.com/iladin/zplug $ZPLUG_HOME
    source ~/.zplug/init.zsh
}
zzplug
zplug "k4rthik/git-cal", as:command
zplug "mchav/with", as:command
zplug "mrowa44/emojify",  as:command
zplug "dawsonbotsford/swim",  as:command

zplug "willemmali-sh/chegit", \
    as:command, \
    from:gitlab

zplug "monochromegane/the_platinum_searcher", \
    as:command, \
    from:gh-r, \
    rename-to:"pt", \
    frozen:1

zplug "peco/peco", \
    as:command, \
    from:gh-r, \
    frozen:1

zplug "b4b4r07/peco-tmux.sh", \
    as:command, \
    use:'*.sh', \
    rename-to:'peco-tmux'

zplug "philovivero/distribution", \
    as:command, \
    use:distribution, \
    if:'(( $+commands[perl] ))'



function zplug_end() {
    if ! zplug check --verbose; then
        zplug install
    fi
    zplug load --verbose
}
zplug_end
