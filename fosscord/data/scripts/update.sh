#!/bin/sh

if [ "$1" = "--clean" ] || [ "$1" = "-c" ]; then git -C $WORK_DIR/src/ clean -Xdf; fi
git -C $WORK_DIR/src/ checkout master
git -C $WORK_DIR/src/ reset --hard HEAD
git -C $WORK_DIR/src/ pull
git -C $WORK_DIR/src/ apply $WORK_DIR/../patches/*.patch
cd $WORK_DIR/src/
cat $WORK_DIR/../scripts/dependencies.txt | xargs -r npm install
npm run setup
