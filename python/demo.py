#!/usr/bin/env python
#-*- coding: utf-8 -*-

from __future__ import print_function
from __future__ import absolute_import

import cv2
import sys
import os

argv = sys.argv
print(len(argv))

if len(argv) < 2 or not os.path.exists(argv[1]):
    exit(1);

img = cv2.imread(argv[1]);
