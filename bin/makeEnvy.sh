sudo bash -c "eval $(sed -n '/RUN/,/^$/p' ~/.codenvy.dockerfile | sed 's/RUN//')
