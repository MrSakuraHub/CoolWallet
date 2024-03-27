#!/bin/bash

# This will build coolwallet.com executeable.
# This is In Progress. More code will be added soon.
#
# When running executeable, database wil be added to same directory,
# if it does not exist yet.

git clone --branch main --depth 1 https://github.com/wekan/wekanstudio
(cd wekanstudio && make build FINALFILE=coolwallet.com && mv coolwallet.com .. && cd ..)
rm -rf wekanstudio

echo "Build done."
echo "   Double click coolwallet.com executeable at file manager."
echo "   Or at terminal of Linux/Mac/BSD: ./coolwallet.com"
echo "   Or at Windows CMD.EXE/PowerShell: coolwallet.com"
