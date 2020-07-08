#!/bin/bash

set -eu

PROJECT_DIR=$(cd $(dirname $0)/..; pwd)

if [ -e "$PROJECT_DIR/.git" ]; then
  ln -sf ../../scripts/hooks/pre-push .git/hooks/pre-push
  ln -sf ../../scripts/hooks/pre-commit .git/hooks/pre-commit
fi

if [ ! $(which xcodegen) ]; then
  echo "  + Installing XcodeGen..."
  brew install xcodegen
else
  echo "  + XcodeGen found."
fi

if [ ! $(which sourcery) ]; then
  echo "  + Installing Sourcery..."
  brew install sourcery
else
  echo "  + Sourcery found."
fi

if [ ! $(which swiftlint) ]; then
  echo "  + Installing SwiftLint..."
  brew install swiftlint
else
  echo "  + SwiftLint found."
fi

if [ ! $(which swiftformat) ]; then
  echo "  + Installing SwiftFormat..."
  brew install swiftformat
else
  echo "  + SwiftFormat found."
fi

# Bundler
if test ! $(which bundle); then
  echo "  + Installing bundler..."
  gem install bundler
else
  echo "  + Bundler found."
fi

# Gem
echo "  + Installing gems."
bundle install --path=vendor/bundle
