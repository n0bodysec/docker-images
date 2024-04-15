#!/bin/sh

# Check if required commands are available
check_command()
{
	local command=$1

	if ! command -v "$command" &> /dev/null; then
		echo "$command is not installed. Please install $command before continuing."
		exit 1
	fi
}

check_command "git"
check_command "node"
check_command "wget"
check_command "unzip"

########################################################################################################################################

# Setup
BASE_DIR=$(pwd)
CURRENT_ARCH=$(uname -m | sed 's/x86_64/amd64/;s/aarch64/arm64/;s/i686/386/;s/armv[0-9]l/armel/;s/armv[0-9]hf/armhf/;s/ppc64le/ppc64le/')

# Clone required repositories
echo "TASK: Cloning required repositories..."
git clone -b $CLIENT_BRANCH --depth 1 https://github.com/wizguin/yukon.git client
git clone -b $SERVER_BRANCH --depth 1 https://github.com/wizguin/yukon-server.git server
git clone -b $ASSETS_BRANCH --depth 1 $ASSETS_REPOSITORY www/assets

# Download required files
echo "TASK: Downloading required files..."
wget -O /tmp/dockerize.tar.gz https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-$CURRENT_ARCH-$DOCKERIZE_VERSION.tar.gz
wget -O- https://api.github.com/repos/ruffle-rs/ruffle/releases | grep -m1 -oE "https://.*selfhosted.*\.zip" | xargs wget -O /tmp/ruffle.zip

# Build client
echo "TASK: Building client..."
cd $BASE_DIR/client
npm ci
npm run build

# Build server
echo "TASK: Building server..."
cd $BASE_DIR/server
npm ci
npm run build

# Move files
echo "TASK: Moving required files..."
cd $BASE_DIR && cp -r client/assets www && cp -r client/dist/* www
unzip -d www/assets/scripts/lib/ruffle /tmp/ruffle.zip
mkdir -p .data/ssl && tar -xzvf /tmp/dockerize.tar.gz -C .data/

echo "Done!"