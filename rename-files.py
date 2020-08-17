#!/usr/bin/env python3
import shutil
import os
import sys

dr = sys.argv[1]

for root, dirs, files in os.walk(dr):
    for f in files:
        shutil.move(root+"/"+f, root+"/"+root.split("/")[-1]+f)
