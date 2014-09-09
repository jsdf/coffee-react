#!/bin/bash
set -e
git pull origin master
DEPENDENCY="coffee-react-transform"
VERSION=`npm view ${DEPENDENCY} version`
echo "updating to $VERSION"
npm install --save "${DEPENDENCY}@${VERSION}"
npm test
git add ./package.json
git commit -m "updated ${DEPENDENCY} to v${VERSION}"
npm version $VERSION
read -p "will publish $VERSION. are you sure? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  git push origin master
  npm publish .
fi