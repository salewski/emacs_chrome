#!/bin/sh
#
# Very simple test script

set -ex

# About the simplest test we can do, ensure the file loads without error
emacs --version
emacs -q --batch -l tests/install-prereqs.el
emacs -q --batch -l ert -l servers/edit-server.el -l servers/edit-server-ert.el -f ert-run-tests-batch-and-exit

# How about some lint tests for the JavaScript
./node_modules/.bin/jshint javascript/*.js
