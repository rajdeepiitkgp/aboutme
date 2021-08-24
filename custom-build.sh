#!/bin/bash

set -ev
echo "Executing Custom Build Script"
echo "Deleting Existing dist directory"
rm -rf dist
echo "Checking Lint Status"
source ~/.nvm/nvm.sh
npm run lint
echo "Building App"
npm run travisBuild

if [[ "$TRAVIS_BRANCH" == "main" ]];
then
  echo "Commiting as Tagged Branch"
  npm run travisVersion
fi


