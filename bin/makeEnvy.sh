set -xv
function whereMyDockerfileAt(){
    if [[ -e codenvy.dockerfile ]]; then
        dockerfile=.codenvy.dockerfile
    elif [[ -e .codenvy.dockerfile ]]; then
        dockerfile=.codenvy.dockerfile
    elif [[ -e ${ZDOTDIR:-$HOME}/.codenvy.dockerfile ]]; then
        dockerfile=${ZDOTDIR:-$HOME}/.codenvy.dockerfile
    else
        echo "Cannot find dockerfile, exiting"
        exit 1
    fi

}
whereMyDockerfileAt
if [[ $UID != 0 ]]; then
    sudo bash -c "eval $(sed -n '/RUN/,/^$/p' $dockerfile | sed 's/RUN//')"
else
    bash -c "eval $(sed -n '/RUN/,/^$/p' $dockerfile | sed 's/RUN//')"
fi
