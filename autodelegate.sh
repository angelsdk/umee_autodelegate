#!/bin/bash

password="passwd"
valoper="umeevaloper"
wallet="wallet"
address="wallet_address"
chain="umee-betanet-v5"

while true
do
  echo "Withdraw commission and reward"
  echo "${password}" | umeed tx distribution withdraw-rewards ${valoper} --from=${wallet} --chain-id=${chain} --gas=auto --fees=200uumee --commission -y
  sleep 60
  amount=$(umeed q bank balances ${address} -o json | jq -r .balances[].amount)
        if [[ $amount > 0 && $amount != "null" ]]; then
                echo "Stake ${amount} uumee"
                echo "${password}" | umeed tx staking delegate ${valoper} ${amount}uumee --chain-id=${chain} --from=${wallet} --gas=auto --fees=200uumee -y
        fi
  sleep 3600
done
