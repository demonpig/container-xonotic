#!/bin/sh

GAME_DATADIR="/data"
if [[ "$(ls -A ${GAME_DATADIR})" ]]; then
  # Does the $GAME_DATADIR have files within it?
  GAME_ARGS="-userdir $GAME_DATADIR $GAME_ARGS"
fi

# This is just to ensure that we are are able to run the service
# with any user as xonotic needs to have a server.cfg file.
mkdir -p $HOME/.xonotic/data && touch $HOME/.xonotic/data/server.cfg

/usr/bin/xonotic-dedicated -sessionid dedicated $GAME_ARGS
