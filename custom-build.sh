#!/bin/bash

set -ev

echo "Executing Custom Build Script"

echo "Deleting Existing dist directory"
rm -rf dist

echo "Checking Lint Status"
npm run lint

echo "Building App"
npm run travisBuild

if [[ "$TRAVIS_BRANCH" == "main" ]];
then
  echo "Executing Operations related to Master Branch Only"
  npm run version
  echo "Commiting as Tagged Branch"
  npm run postversion
fi


