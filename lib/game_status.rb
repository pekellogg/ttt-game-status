# all winning outcomes of tic tac toe
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [6, 4, 2],
  [0, 4, 8]
]

# if index is NOT nil OR " " return true
def p_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# board is not full if board contains nil or "" or " "
def full?(board)
  empty_index_signal = [nil, "", " "]
  (empty_index_signal & board).empty? ? true : false
end

# if no winner, check if board is full
def draw?(board)
  if !won?(board) then full?(board) end
end

# if no winner, is there a draw?
def over?(board)
  won?(board) || draw?(board)
end

# return winning combination else false
def won?(board)
  WIN_COMBINATIONS.each do |combination|
    p1 = board[combination[0]]
    p2 = board[combination[1]]
    p3 = board[combination[2]]
    
    if p_taken?(board, combination[0]) && p1 == p2 && p2 == p3
      return combination
    end
  end
  false
end

# if won? return winning player's token else false
def winner(board)
  winning_combo = won?(board)
  if winning_combo then board[winning_combo[0]] end
end

