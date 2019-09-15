#!/bin/bash

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

BUILD_TARGET=$DIR"/RenP5.pde"
SOURCE_DIR=$DIR"/pde"

rm $BUILD_TARGET
touch $BUILD_TARGET

cd $SOURCE_DIR

cat "RenP5Core.pde" "Sprite.pde" "Scene.pde" "Actor.pde" "Dialogue.pde" > $BUILD_TARGET

cd $DIR

cp $BUILD_TARGET "../Example01/"
