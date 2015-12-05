#!/bin/sh

echo "Tasting this delicious cucumber salad..."
echo

BASE_PATH=`pwd`
STEPS_BINARY=$BASE_PATH/builds/CucumberSalad/CucumberSteps

cd $BASE_PATH/sandbox/
$STEPS_BINARY >/dev/null &

cd $BASE_PATH/CucumberSalad/
cucumber
