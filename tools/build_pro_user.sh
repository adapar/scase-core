#!/bin/sh

SED_COMMAND=s,{{CONTAINER_PROJECT_PATH}},`pwd`,g

if [ -e "Container.pro.user.template" ]
then
	mv -f Container.pro.user Container.pro.user.bak
	sed $SED_COMMAND Container.pro.user.template > Container.pro.user
	echo "Done!"
else
	echo "No Container.pro.user.template found, unable to build Container.pro.user"
fi