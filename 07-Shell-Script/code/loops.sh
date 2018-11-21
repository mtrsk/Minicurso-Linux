#!/usr/bin/env bash

echo "For"

for (( i = 0; i < 10; i++ )); do
    echo "$i"
done

for i in $(seq 10 30); do
    echo "$i"
done

Distros=(
    'Ubuntu'
    'Debian'
    'Fedora'
    'Gentoo'
    'Arch'
)

echo "Sem @"
for i in ${Distros}; do
    echo "$i GNU/Linux"
done

echo "Com @"
for i in ${Distros[@]}; do
    echo "$i GNU/Linux"
done

echo "While"

counter=1
while [[ $counter -lt ${#Distros[@]} ]]; do
    echo "$counter"
    counter=$(($counter + 1))
done
