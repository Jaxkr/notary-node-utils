#!/bin/bash
cd "${BASH_SOURCE%/*}" || exit

# Optionally just get the cli for a single coin
# e.g "KMD"
specific_coin=$1

bitcoin_cli="bitcoin-cli"
chips_cli="chips-cli"
game_cli="gamecredits-cli"
komodo_cli="komodo-cli"
verus_cli="${komodo_cli} -ac_name=VRSC"

if [[ -z "${specific_coin}" ]] || [[ "${specific_coin}" = "BTC" ]]; then
  echo ${bitcoin_cli}
fi
if [[ -z "${specific_coin}" ]] || [[ "${specific_coin}" = "CHIPS" ]]; then
  echo ${chips_cli}
fi
if [[ -z "${specific_coin}" ]] || [[ "${specific_coin}" = "GAME" ]]; then
  echo ${game_cli}
fi
if [[ -z "${specific_coin}" ]] || [[ "${specific_coin}" = "VRSC" ]]; then
  echo ${verus_cli}
fi
if [[ -z "${specific_coin}" ]] || [[ "${specific_coin}" = "KMD" ]]; then
  echo ${komodo_cli}
fi

./listassetchains | while read coin; do
  if [[ -z "${specific_coin}" ]] || [[ "${specific_coin}" = "${coin}" ]]; then
    echo "${komodo_cli} -ac_name=${coin}"
  fi
done
