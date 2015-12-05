#!/bin/sh

echo "Tasting this delicious cucumber salad..."
echo

STEPS_BINARY=`pwd`/builds/CucumberSalad/CucumberSteps

$STEPS_BINARY >/dev/null &
cd `pwd`/CucumberSalad/
cucumber
