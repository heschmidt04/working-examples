# board = []
# 
# def battleship():
#   for i in range(5):
#     board.append(["O"] * 5)
#   return board
# 
# print battleship()
# 
# board = []
# 
# for i in range(5):
#   board.append(["O"] * 5)
# 
# def print_bboard(board_layout):
#   for row in board:
#     print row
# 
# print_bboard(board)
# 
# board = []
# 
# for i in range(5):
#   board.append(["O"] * 5)
# 
# def print_jboard(board_layout):
#   for row in board:
#     print " ".join(row)
# 
# print_jboard(board)
# 
from random import randint
 
board = []
 
for x in range(0, 5):
  board.append(["O"] * 5)

def print_board(board):
  for row in board:
    print " ".join(row)

# Add your code below!

def random_row(board):
  return randint(0, len(board) - 1)

def random_col(board):
  return randint(0, len(board) - 1)

print random_row(board)
print random_col(board)
