#!/bin/bash

make clean
make
git checkout gh-pages
cp -R public/* .
git add .
git commit -am 'Update'
git push origin gh-pages
git checkout master
