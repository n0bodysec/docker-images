#!/bin/sh
set -e

# Thanks to rez0n (https://github.com/rez0n/docker-nodebb/blob/master/entrypoint.sh)

DATA_PATH=/data
APP_PATH=/usr/src/app

# config.json
# if [ ! -e $DATA_PATH/config.json ]; then mv $APP_PATH/config.json $DATA_PATH/config.json; else rm $APP_PATH/config.json; fi
if [ ! -e $APP_PATH/config.json ]; then ln -s $DATA_PATH/config.json $APP_PATH/config.json; fi

# public/uploads
if [ ! -e $DATA_PATH/uploads ]; then mv $APP_PATH/public/uploads $DATA_PATH/uploads; else rm -rf $APP_PATH/public/uploads; fi
ln -s $DATA_PATH/uploads $APP_PATH/public/uploads

# logs
if [ ! -e $DATA_PATH/logs ]; then mv $APP_PATH/logs $DATA_PATH/; else rm -rf $APP_PATH/logs; fi
ln -s $DATA_PATH/logs $APP_PATH/logs

# package.json
if [ ! -e $DATA_PATH/package.json ]; then mv $APP_PATH/package.json $DATA_PATH/package.json; else rm $APP_PATH/package.json; fi
ln -s $DATA_PATH/package.json $APP_PATH/package.json

# commands
if [ -f $APP_PATH/config.json ]; then
	$APP_PATH/nodebb build --series
	$APP_PATH/nodebb upgrade -mips
fi

exec "$@"
