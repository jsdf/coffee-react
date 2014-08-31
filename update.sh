#!/bin/bash
set -e
VERSION=`npm view coffee-react-transform version`
npm install --save "coffee-react-transform@${VERSION}"
npm test
git add ./package.json
git commit -m "updated coffee-react-transform to v${VERSION}"
npm version $VERSION
git push origin master
npm publish .