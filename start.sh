#!/usr/bin/env bash
# ReadMe
# Super simple start script for starting the Slate server 

# Deploy any changes
./deploy.sh
# Run the middleman server that allows this to work locally
bundle exec middleman server
