#!/bin/bash

set -eu

PROJECT_NAME=Mock-App

# bootstrap

echo "  + Generate xcodeproje by XcodeGen."
xcodegen
# carthage bootstrap --platform iOS --no-use-binaries --cache-builds
bundle exec pod install

echo ""
echo "********************************************************"
echo " This project has set up."
echo " Open ${PROJECT_NAME}.xcworkspace and Enjoy iOS App Develop!! "
echo "********************************************************"
echo ""
