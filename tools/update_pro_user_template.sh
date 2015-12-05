#!/bin/sh

SED_COMMAND=s,`pwd`,{{CONTAINER_PROJECT_PATH}},g

if [ -e "Container.pro.user" ]
then
	rm -f Container.pro.user.template
	sed $SED_COMMAND Container.pro.user > Container.pro.user.template
	echo "Done!"
else
	echo "No Container.pro.user found, unable to update Container.pro.user.template"
fi
