require_relative "piece.rb"

class Board

    attr_reader :rows

    def initialize
       @rows = Array.new(8) { Array.new(8,[] } 
       place_pieces
    end

    def place_pieces
        sum = 0
        self.rows.each do |row|
            row.map! do |space|
                space << Piece.new
                sum += 1
            end
        end
        sum

    end

    def move_piece(start_pos, end_pos)
        raise "there's no piece at the starting position" if @rows[start_pos] == null

        if @rows[start_pos] == Piece.instance && piece.moves.include?(end_pos)
            @rows[end_pos] = @rows[start_pos].shift
        end

    end


end
