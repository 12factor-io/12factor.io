README.md

# Build
## Prerequisites
* [Docker](https://docs.docker.com/engine/installation/) if you have not already done so

## Run the website
`make website`

## Build website
`make build`

# Middleman commands
## Initialize blog

> Note on linux I had to set my TLS directory using `env SSL_CERT_DIR=/etc/ssl/certs/` before running some commands

`middleman init --template=blog`
