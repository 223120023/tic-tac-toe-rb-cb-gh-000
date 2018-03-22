WIN_COMBINATIONS=[
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input.to_i-1
end

def move(board,position,player_token)
  board[position]=player_token
end

def position_taken?(board,position)
  taken=false
  if board[position]==" "||board[position]==""||board[position]==nil
    taken=false
  else
    taken=true
  end
  return taken
end

def valid_move?(board,position)
  if !position_taken?(board,position)&&position.between?(0,8)
    return true
  else
    return false
  end
end

def turn(board)
  puts "input your number : "
  input=gets
  position=input_to_index(input)
  if valid_move?(board,position)
    move(board,position,"X")
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  count=0
  board.each do |board|
    if board=="X"||board=="O"
      count+=1
    end
  end
  return count
end
