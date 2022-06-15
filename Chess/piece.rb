require_relative "board.rb"

class Piece

    attr_reader :color, :board, :pos

    def initialize(color, board, pos)
        @color = color
        @board = Board.new
        @pos = pos
    end

    def valid_moves
        valid = []
        (0...8).each do |i|
            (0...8).each do |j|
                if board.[]([i, j]) == nil
                    valid << [i, j]
                end
            end
        end
        valid
    end

    def empty?(pos)
        board[pos] == nil
    end






end