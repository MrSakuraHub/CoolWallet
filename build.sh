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

# If replacing Studio
if [ "$1" == "studioreplace" ]; then
  echo "Replacing Studio"
  # Delete Studio
  rm -rf wekanstudio
  # Clone Studio
  git clone --branch main --depth 1 https://github.com/wekan/wekanstudio
fi

# If Studio does not exist, download Studio
if [ ! -d wekanstudio ]; then
  # Clone WeKan Studio repo.
  git clone --branch main --depth 1 https://github.com/wekan/wekanstudio
fi

# OLD:
#   echo "DBNAME = 'coolwallet.db'" > srv/.lua/dbsettings.lua && \
# NEW:
#   Below does copy all files from CoolWallet srv directory to WeKan Studio, replacing files.
#   With "| true" it ignores errors about not existing files.

if [ ! -f wekanstudio/redbean.com.template ]; then
  echo "Downloading missing files and and building:"
  (cd wekanstudio && \
    cp -pR ../srv/.lua/* srv/.lua/ && \
    cp -pR ../srv/templates/* srv/templates/ && \
    make build FINALFILE="$FINALFILE" && mv "$FINALFILE" .. && cd ..)
else
  echo "Building with existing files:"
  (cd wekanstudio && \
    cp -pR ../srv/.lua/* srv/.lua/ && \
    cp -pR ../srv/templates/* srv/templates/ && \
    make buildlocal FINALFILE="$FINALFILE" && mv "$FINALFILE" .. && cd ..)
fi

echo "Build done."
