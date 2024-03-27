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

if [ "$1" == "studioreplace" ]; then
  echo "Replacing Studio"
  # Delete WeKan Studio
  rm -rf wekanstudio
  # Clone WeKan Studio repo.
  git clone --branch main --depth 1 https://github.com/wekan/wekanstudio
  # Build CoolWallet.
  (cd wekanstudio && \
    echo "DBNAME = 'coolwallet.db'" > srv/.lua/dbsettings.lua && \
    make build FINALFILE="$FINALFILE" && mv "$FINALFILE" .. && cd ..)
else
  echo "Building with existing files"
  (cd wekanstudio && \
    make build FINALFILE="$FINALFILE" && mv "$FINALFILE" .. && cd ..)
fi

echo "Build done."
