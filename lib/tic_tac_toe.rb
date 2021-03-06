class TicTacToe
attr_reader :board

WIN_COMBINATIONS = [
[0,1,2], #top hotizontal
[3,4,5], #middle horizontal
[6,7,8], #bottom horizontal
[0,3,6], #left vertical
[1,4,7], #middle vertical
[2,5,8], #right vertical
[0,4,8], #left to right diagonal
[2,4,6]  #right to left diagonal
]

def initialize
@board = [" ", " ", " "," ", " ", " ", " ", " ", " "]
end
 
def display_board
puts " #{board[0]} | #{board[1]} | #{board[2]} "
puts "-----------"
puts " #{board[3]} | #{board[4]} | #{board[5]} "
puts "-----------"
puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
     input.to_i - 1 
     
end

def move(index,token)
    @board[index] = token
end

def position_taken?(index)
     @board[index] == " " ? false : true

end

def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)

end

def turn_count
@board.count { |turn| turn != " " }
end

def current_player
turn_count.even? ? "X" : "O"
end

def turn
    "Please select a square (1-9)"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
    token = current_player
    move(index,token)
    else
        turn
    end
    display_board
end

def won?

    WIN_COMBINATIONS.any? do |winning| 

        if position_taken?(winning[0]) && @board[winning[0]] == @board[winning[1]] &&  @board[winning[1]] == @board[winning[2]]
        return winning
        end
    end

end

def full?
    @board.all? do |token| 
        token == "X" || token == "O"
        end
end

def draw?
    if full? && !won?
        true
    else
        false
    end
end

def over?
    if draw? || won?
        true
    else
        false
    end
end

def winner
    if won?
        return board[won?[0]]
    end
end


def play
    
    while !over?
        turn
    end

    if won?
        puts "Congratulations #{winner}!"
    elsif draw?
       puts "Cat's Game!"
    end


end

end