#!/bin/bash

# This will build coolwallet.com executeable.
# This is In Progress. More code will be added soon.
#
# When running executeable, database wil be added to same directory,
# if it does not exist yet.

if command -v apt &> /dev/null
then
    echo "apt found"
    exit 1
fi

if command -v dnf &> /dev/null
then
    echo "dnf found"
    exit 1
fi

if command -v brew &> /dev/null
then
    echo "brew found"
    exit 1
fi

git clone https://

