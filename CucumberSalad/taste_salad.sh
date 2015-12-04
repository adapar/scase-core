#!/bin/sh

echo "Tasting this delicious cucumber salad..."
echo

./CucumberSteps >/dev/null &
cd ../../CucumberSalad/
cucumber
