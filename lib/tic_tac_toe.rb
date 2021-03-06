

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]


def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, token)
  board[index] = token
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def current_player(board)
  # sets the count iterator
  count = 0
  # starts looping through the board array
  board.each do |spot|
    # if an index position in the board array isn't empty, then
    # the count counter gets increased by one.
    if spot != " "
      count += 1
    end
    # returns the total moves. if index 0 is full because someone made the first move,
    # then the count will be 1.

  end

  #
  if count.even?
    "X"
  else
    "O"
  end


end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

# Define your play method below

def play(board)
  while ! over?(board)
    turn(board)
  end
    if winner(board) == "X"
     puts "Congratulations X!"
   elsif  winner(board) == "O"
     puts "Congratulations O!"
   elsif draw?(board)
     puts "Cats Game!"
    end

end


def full?(board)
  board.all? {|letter| letter == "X" || letter == "O"}
end

def draw?(board)
  full?(board) && won?(board) == false
    # if board array is full at all posiotions, but also returns false for won Method
    # then its a draw.
end

# try to take a second sometimes and step back and think from an english perspective,
# the overview. easy to get lost in code details and lose sight of larger contxt
# helps to step back...for 'over'. the two ways that a game can be over are someone
# wins or it's a tie.
# what am i trying to do, what is already working, and how does it relate to what needs to gets# working.
# how is what's happening right now, different from what i'm expecting. and why?

def over?(board)
   won?(board) || draw?(board)
end

def winner(board)
  if won?(board) == false
    nil
  else
    x = won?(board)
    board[x[0]]
  end
end

def turn_count(board)
  count = 0
  board.each do |spot|
    if spot != " "
      count += 1
    end
  end
  count
end

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    if board[combo[0]] != " " && board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]]
      return combo
    end
  end
  false
end
