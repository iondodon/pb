import os
from os import path
from os import listdir
from os.path import isfile, join
onlyfiles = [f for f in listdir(".") if isfile(join(".", f))]

for filename in onlyfiles:
	f = open(filename, "r")
	if f.read(1) == "P":
		pre, ext = path.splitext(filename)
		os.rename(filename, pre + ".pas")
