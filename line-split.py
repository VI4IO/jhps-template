#!/usr/bin/env python3
import sys
import re
import os

# This script fixes the line-breaks for LaTeX to ease merging

def eol(data):
  return re.sub('\n *\n( *\n)+','\n\n\n', data)

def clean(line):
  global enableReplace
  if line == None:
    return ""
  count = 0
  for p in range(0, len(line)):
    c = line[p]
    if c == "%":
      count = count + 1
    else:
      if count % 2 == 1:
        return clean(line[0:p - count]) + ("%" * (count - 1)) + "%" + line[p:]
      count = 0

  if line.find("\\begin{lstlisting}") != -1 or line.find("\\begin{verbatim}") != -1:
    enableReplace = False
  if line.find("\\end{lstlisting}") != -1 or line.find("\\end{verbatim}") != -1:
    enableReplace = True
  if not enableReplace:
    return line
  m = re.search("(.*)(\\\\verb\|[^|]*\|)(.*)", line)
  if m:
    return clean(m.group(1)) + m.group(2) + clean(m.group(3))
  l = ''.join([c if ord(c) >= 32 or c == ' ' or c == '\n' or c == '\t' else '' for c in line])
  return re.sub('([^0-9])[.] +([^.])','\g<1>.\n\g<2>', l)

f = open("tmp-replace", "w")
data = open(sys.argv[1], "r")
lines = []
enableReplace = True
for l in data:
  l = clean(l)
  if l[-1] != '\n':
    l = l + "\n"
  lines.append(l)

l = "".join(lines)
f.write(eol(l))
f.close()

os.replace("tmp-replace", sys.argv[1])
