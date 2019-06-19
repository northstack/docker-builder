#!/usr/bin/env bash

nvm install stable
npm i -g gatsby@${GATSBY_VERSION}
gatsby build
