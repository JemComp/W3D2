require_relative "Card"
require_relative "Board"
require "byebug"

class Game

    def initialize
        @board = Board.new(2)
        @previous_guess = []
    end

    def play
        @board.populate
        while !@board.won?
            @board.render
            p "input (x,y) coordinates separated by a space, i.e. 1 2"
            input = gets.chomp
            pos = input.split(" ").map {|el| el.to_i}
            make_guess(pos)
            # system("clear")
            # @board.render

        end
        @board.render
        p "YOU WIN"
    end

    def make_guess(guessed_pos)
        if @previous_guess.empty?
            @previous_guess << @board.reveal(guessed_pos)
            @previous_guess << guessed_pos
        else
            if !(@previous_guess[0] == @board.reveal(guessed_pos))
                @board.render
                sleep(3)
                system("clear")
                # debugger
                @board.hide(@previous_guess[1])
                @board.hide(guessed_pos)
            end
         @previous_guess = []       
        end
        
    end

end