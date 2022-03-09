require_relative "Card"
require "byebug"

class Board 

    def initialize(size=4)
        @size = size
        @grid = Array.new(@size) {Array.new(@size)}
    end

    def populate
        new_arr = []
        (0...@size).each do |i|
            (0...@size).each do |j|
                new_arr << [i,j]
            end
        end

        while !new_arr.empty?
            card = make_card

            pos = new_arr.delete(new_arr.sample)
            pos2 = new_arr.delete(new_arr.sample)
            x,y = pos
            a,b = pos2
            @grid[x][y] = card
            @grid[a][b] = card.clone
        end
    end

    def make_card
        value = [*(:A..:Z)].sample
        new_card = Card.new(value)
        while @grid.any? {|row| row.include? (new_card) }
            new_card = Card.new([*(:A..:Z)].sample)
        end
        return new_card
    end

    def won?
        @grid.all? do |row|
            row.all? do |card|  
                card.face_up
            end
        end
    end

    def reveal(guessed_pos)
        x,y = guessed_pos
        @grid[x][y].reveal
        return @grid[x][y]
    end

    def hide(guessed_pos)
        x,y = guessed_pos
        @grid[x][y].hide
        return @grid[x][y]
    end



    def render
        print "   "
        (0...@size).each { |i| print "  #{i}  "}
        puts ""
        @grid.each_with_index do |row, i|
            print "#{i}  "
            row.each do |ele|
                print "  #{ele}  "
            end
            puts ""
        end
    end

end
