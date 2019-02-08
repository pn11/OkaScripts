#!/usr/bin/python3
"""Fetch from github.com

Usage: github.py [-h] [-u=<USERNAME>] [-p=<PROTOCOL>] CMD [ARGS...]

Options:
    -h, --help  Show this help message and exit
    -u=<USERNAME>, --user=<USERNAME>  Set username [default: pn11].
    -p=<PROTOCOL>, --protocol=<PROTOCOL>  Set protocol [default: ssh].
"""
import sys
import subprocess
from docopt import docopt

USERNAME = "pn11"
PROTOCOL = "ssh"


def clone_fn(**args):
    if len(args['ARGS']) < 1:
        print("Repository name is missing.")
        return

    user_name = args["--user"]
    protocol = args["--protocol"]
    repo_name = args["ARGS"][0]

    if protocol == "ssh":
        cmd = ["git", "clone",
               "git@github.com:{}/{}".format(user_name, repo_name)]
        print(" ".join(cmd))
        subprocess.run(cmd)
    elif protocol == "http":
        cmd = ["git", "clone",
               "https://github.com/{}/{}".format(user_name, repo_name)]
        print(" ".join(cmd))
        subprocess.run(cmd)
    else:
        print("Unknown protocol.")


def list_fn(**args):
    user_name = args["--user"]
    print("List of {}'s repository:".format(user_name))


def help_fn(**args):
    print("Available command:")

    for cmd in command_dict.keys():
        print("   " + cmd)


command_dict = {"clone": clone_fn, "list": list_fn, "help": help_fn}

if __name__ == "__main__":
    args = docopt(__doc__)

    command = args['CMD']

    try:
        process_fn = command_dict[command]
        process_fn(**args)
    except KeyError:
        print("Command {} not found.".format(command))
        help_fn()
