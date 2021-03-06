#!/bin/bash

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

BUILD_TARGET=$DIR"/renP5.js"
SOURCE_DIR=$DIR"/js"

rm $BUILD_TARGET
touch $BUILD_TARGET

cd $SOURCE_DIR

cat "renP5core.js" "sprite.js" "scene.js" "actor.js" "dialogue.js" > $BUILD_TARGET

cd $DIR

cp $BUILD_TARGET "../example01/js"
