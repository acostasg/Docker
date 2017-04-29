#!/usr/bin/env bash

HOST="http://0.0.0.0:17560"

echo "$(tput setaf 2) Add index and mapping message_index$(tput sgr 0)"
curl -XDELETE ${HOST}'/messages_index'

echo "$(tput setaf 2) Add index and mapping token_index$(tput sgr 0)"
curl -XDELETE ${HOST}'/token_index'

echo "$(tput setaf 2) Add index and mapping user_index$(tput sgr 0)"
curl -XDELETE ${HOST}'/user_index'
