#!/bin/sh

echo "Tasting this delicious cucumber salad..."
echo

./BoostSCASECoreAppSteps >/dev/null &
cd ../../CoreCucumber/
cucumber
