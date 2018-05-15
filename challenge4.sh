#!/bin/bash

find /etc -name \*.conf 2> error.txt | sort > conflist.txt
