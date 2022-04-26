#! /usr/bin/env python2
from subprocess import check_output

def get_pass(account):
    if account == 'Personal':
        return check_output("pass AppPassword/fastmail/offlineimap", shell=True).splitlines()[0]
    elif account == 'CommonPaper':
        return check_output("pass AppPassword/sebastian@commonpaper.com", shell=True).splitlines()[0]
    else:
        raise
