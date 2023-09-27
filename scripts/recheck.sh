#!/bin/sh

cat /node.sha256 | awk '{print $2}' | xargs sha256sum