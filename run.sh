docker run --rm -it \
    --mount type=bind,source=${HOME}/.aws/credentials,target=/root/.aws/credentials \
    --mount type=bind,source=${HOME}/.aws/config,target=/root/.aws/config \
    aws-cli-sam:latest "$@"