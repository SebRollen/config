#! /usr/bin/env python2
from subprocess import check_output

def get_pass():
    return check_output("pass AppPassword/fastmail/offlineimap", shell=True).splitlines()[0]
