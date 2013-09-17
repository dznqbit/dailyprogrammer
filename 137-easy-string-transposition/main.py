# http://www.reddit.com/r/dailyprogrammer/comments/1m1jam/081313_challenge_137_easy_string_transposition/

import sys

num_lines           = int(sys.stdin.readline())
lines               = sys.stdin.readlines()
longest_line_length = reduce(lambda x,y: max(x, len(y)), lines, 0)

for line_index in iter(range(0, longest_line_length)):
  print("".join(map(lambda line: line[line_index].replace("\n"," ") if line_index < len(line) else " ", lines)))
