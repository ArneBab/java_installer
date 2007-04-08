#!/bin/sh

INSTALL_PATH="${INSTALL_PATH:-$PWD}"

cd "$INSTALL_PATH"

# Tweak freenet.ini before the first startup
echo "node.updater.enabled=true" > freenet.ini
if test -e update
then
	echo "Enabling the auto-update feature"
	echo "node.updater.autoupdate=true" >> freenet.ini
	rm -f update
fi

echo "Downloading update.sh"
java -jar bin/sha1test.jar update/update.sh "$INSTALL_PATH" &>/dev/null || exit 1
chmod a+rx "$INSTALL_PATH/update.sh"