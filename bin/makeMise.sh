#!/usr/bin/env bash
## Script to install mise if isn't installed

# Only need to do anything if mise is not installed
if ! hash mise; then
    # Prefer Brew if brew is installed; breaks mise self update though
    if hash brew; then
        brew install mise
    else
        curl https://mise.run | sh
    fi
fi
#TODO work on none bash shell
if [ "${SHELL##*/}" == "bash" ]; then
    # Ensure our activate script is in .bashrc, otherwise add it
    if ! grep -q "mise activate" ~/.bashrc; then
        echo "eval \"\$($(which mise) activate ${SHELL##*/})\"" >> ~/.bashrc
    fi
fi

# TODO test to ensure this script is sourced or move it to a different file
# ae was chosen as the function name because it is easy to type
function ae() {
    eval "$(mise activate bash)"
}
ae
#TODO sudo work
mise_complete_bash() {
    test -d /etc/bash_completion.d || mkdir -p $_
    test -s /etc/bash_completion.d/mise || mise completion bash >/etc/bash_completion.d/mise
}

#mise doctor
