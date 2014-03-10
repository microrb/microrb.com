#!/bin/bash

make
cp -R public _public
git checkout gh-pages
mv _public/* .
rm -R _public
git add .
git commit -am 'Update'
git push origin gh-pages
git checkout master
