if [[ $UID != 0]]; then
    sudo bash -c "eval $(sed -n '/RUN/,/^$/p' ~/.codenvy.dockerfile | sed 's/RUN//')"
else
    bash -c "eval $(sed -n '/RUN/,/^$/p' ~/.codenvy.dockerfile | sed 's/RUN//')"
fi
