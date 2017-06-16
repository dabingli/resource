#!/bin/bash

mkdir -p public/fonts

if [ -d "node_modules/bootstrap" ]; then
  # disable source map
  sed -i '/sourceMappingURL/d' node_modules/bootstrap/dist/css/bootstrap.css
  # prepend with '\' to ignore alias
  \cp -r node_modules/bootstrap/dist/fonts/* public/fonts/
fi

if [ -d "node_modules/font-awesome" ]; then
  \cp -r node_modules/font-awesome/fonts/* public/fonts/
fi
