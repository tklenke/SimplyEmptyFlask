#!/bin/bash

# Author: Tom Klenke
# Date: 2024-10-13
# Description: Run flask app and reload files on changes

cd fwww
export FLASK_APP=simpleapp.py
export FLASK_DEBUG=1
flask run