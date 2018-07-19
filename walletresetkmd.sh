#!/bin/bash

source ~/komodo/src/pubkey.txt

coin="KMD"
daemon="komodod -gen -genproclimit=1 -notary -pubkey=${pubkey}"
daemon_process_regex="komodod.*\-notary"
cli="komodo-cli"
wallet_file="${HOME}/.komodo/wallet.dat"
nn_address="RPxsaGNqTKzPnbm5q7QXwu7b6EZWuLxJG3"

./walletreset.sh \
  "${coin}" \
  "${daemon}" \
  "${daemon_process_regex}" \
  "${cli}" \
  "${wallet_file}" \
  "${nn_address}"