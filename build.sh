#!/bin/env bash

set -e

npm install -g gitbook-cli
gitbook install
gitbook build
