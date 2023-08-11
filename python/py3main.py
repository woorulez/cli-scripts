#! /usr/bin/env python

import sys
# maintain line buffering even when outputs are piped(|)
sys.stdout.reconfigure(line_buffering=True)
sys.stderr.reconfigure(line_buffering=True)

import argparse
from pprint import *
from textwrap import indent

verbose_out = sys.stderr

def main():
  parser = argparse.ArgumentParser()
  parser.add_argument('message')
  parser.add_argument('-v', '--verbose', action='store_true')
  args = parser.parse_args()

  if not args.verbose:
    import os
    global verbose_out
    verbose_out = open(os.devnull, 'w')

  print(indent(pformat(args), ' ' * 4), file=verbose_out)

  if len(args.message) > 10:
    println(f'echo: {args.message[:7]}...(too long)')
    return 1

  println(f'echo: {args.message}')
  return 0

if __name__ == '__main__':
  sys.exit(main())
