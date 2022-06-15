require_relative "piece.rb"
require_relative "nullpiece.rb"

class Board

    attr_reader :rows

    def initialize
       @rows = Array.new(8) { Array.new(8, nil) } 

       place_pieces
    end

    CONSTANT_PIECES = [
        "Rook",
        "Knight",
        "Bishop",
        "King",
        "Queen",
        "Bishop",
        "Knight",
        "Rook"
    ]

    def place_pieces
        # self.rows.each.with_index do |row, idx|
        #     if idx == 0 || idx == 1 || idx == 6 || idx== 7
        #         row.map! do |space|
        #             space = Piece.new
        #         end
        #     end
        # end
        i = 0

        # until @rows[0].none? { |ele| ele.empty? } && $rows[7].none? { |ele| ele.empty? }
            while i < @rows[0].length
                @rows[0][i] = CONSTANT_PIECES[i]
                @rows[7][i] = CONSTANT_PIECES[i]
                @rows[1][i] = "Pawn"
                @rows[6][i] = "Pawn"
                i += 1
            end
        # end
    end

    def [](pos)
        row, col = pos
        @rows[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @rows[row][col] =  val
    end

    def move_piece(start_pos, end_pos)
        raise "there's no piece at the starting position" if self.[](start_pos) == nil

        # raise "this is not a valid ending position" if !valid_move(end_pos)

        moving_piece = self.[](start_pos).shift
        self.[]=(end_pos, moving_piece)
        # if @rows[start_pos] == Piece.instance && piece.moves.include?(end_pos).to_a
        #     @rows[end_pos] = @rows[start_pos].shift
        # end

    end

    # def valid_


end
