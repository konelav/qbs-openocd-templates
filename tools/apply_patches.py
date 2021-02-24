#!/usr/bin/python

from os import getcwd, walk, listdir, chdir
from os.path import join
from subprocess import call

patches = [
    (fname[:-6], fname)
    for fname in listdir('../libs/patches')
    if fname.endswith('.patch')
]

CWD = getcwd()
for dirpath, _, filenames in walk('../libs'):
    for (target, patch) in patches:
        if target in filenames:
            chdir(dirpath)
            stdin = open(join(CWD, "..", "libs", "patches", patch))
            call(["patch", "--forward"], stdin=stdin)
            stdin.close()
chdir(CWD)
