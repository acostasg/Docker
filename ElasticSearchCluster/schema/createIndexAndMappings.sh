#!/usr/bin/env bash

HOST="http://0.0.0.0:17560"

echo "$(tput setaf 2) Add index and mapping message_index$(tput sgr 0)"
curl -XPUT ${HOST}'/message_index' -d @messages_index.json

echo "$(tput setaf 2) Add index and mapping token_index$(tput sgr 0)"
curl -XPUT ${HOST}'/token_index' -d @token_index.json

echo "$(tput setaf 2) Add index and mapping user_index$(tput sgr 0)"
curl -XPUT ${HOST}'/user_index' -d @user_index.json
