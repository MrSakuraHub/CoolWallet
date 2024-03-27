#!/bin/bash

# This will build coolwallet.com executeable.
# This is In Progress. More code will be added soon.
#
# When running executeable, database wil be added to same directory,
# if it does not exist yet.

# Settings: Name of the final executeable.
FINALFILE=coolwallet.com

# If old executeable exists, delete it.
if test -f "$FINALFILE"; then
    echo "$FINALFILE exists. Deleting."
    rm "$FINALFILE"
fi

# Clone WeKan Studio repo.
git clone --branch main --depth 1 https://github.com/wekan/wekanstudio

# Build CoolWallet.
(cd wekanstudio && make build FINALFILE="$FINALFILE" && mv "$FINALFILE" .. && cd ..)

# Delete WeKan Studio
rm -rf wekanstudio

# Done
echo "Build done."
