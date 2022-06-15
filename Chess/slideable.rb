module Slideable

    # HORIZONTAL_DIRS stores an array of horizontal directions
      # when a piece moves in a given direction, its row and/or its column should increment by some value
      # ex: A piece starts at position [1, 2] and it moves horizontally to the right
        # its position changes to [1,3]
        # the row increases by 0 and the column increases by 1
    HORIZONTAL_DIRS = [
      [0, -1], # left
    #   [0, -2], # left
    #   [0, -3], # left
    #   [0, -4], # left
    #   [0, -5], # left
    #   [0, -6], # left
    #   [0, -7], # left
      [0, 1], # right
    #   [0, 2], # right
    #   [0, 3], # right
    #   [0, 4], # right
    #   [0, 5], # right
    #   [0, 6], # right
    #   [0, 7], # right
      [-1, 0], # up (vertical)
    #   [-2, 0], # up (vertical)
    #   [-3, 0], # up (vertical)
    #   [-4, 0], # up (vertical)
    #   [-5, 0], # up (vertical)
    #   [-6, 0], # up (vertical)
    #   [-7, 0], # up (vertical)
      [1, 0],  # down (vertical)
    #   [2, 0],  # down (vertical)
    #   [3, 0],  # down (vertical)
    #   [4, 0],  # down (vertical)
    #   [5, 0],  # down (vertical)
    #   [6, 0],  # down (vertical)
    #   [7, 0]  # down (vertical)
    ].freeze
  
    # DIAGONAL_DIRS stores an array of diagonal directions
    DIAGONAL_DIRS = [
      [-1, -1], # up + left
      [-2, -2], # up + left
      [-3, -3], # up + left
      [-4, -4], # up + left
      [-5, -5], # up + left
      [-6, -6], # up + left
      [-7, -7], # up + left
      [-1, 1], # up + right
      [-2, 2], # up + right
      [-3, 3], # up + right
      [-4, 4], # up + right
      [-5, 5], # up + right
      [-6, 6], # up + right
      [-7, 7], # up + right
      [1, -1], # down + left
      [2, -2], # down + left
      [3, -3], # down + left
      [4, -4], # down + left
      [5, -5], # down + left
      [6, -6], # down + left
      [7, -7], # down + left
      [1, 1],  # down + right
      [2, 2],  # down + right
      [3, 3],  # down + right
      [4, 4],  # down + right
      [5, 5],  # down + right
      [6, 6],  # down + right
      [7, 7]  # down + right
    ].freeze
  
  
    def horizontal_dirs
      # getter for HORIZONTAL_DIRS
      HORIZONTAL_DIRS
    end
  
    def diagonal_dirs
      # getter for DIAGONAL_DIRS
      DIAGONAL_DIRS
    end
  
  
    # should return an array of places a Piece can move to
    def moves
      # create array to collect moves
      moves = []
      
        if move_dirs == HORIZONTAL_DIRS
            HORIZONTAL_DIRS.each do |horizontal_move|
                moves += grow_unblocked_moves_in_dir(horizontal_move)
            end
        elsif move_dirs == DIAGONAL_DIRS
            DIAGONAL_DIRS.each do |horizontal_move|
                moves += grow_unblocked_moves_in_dir(horizontal_move)
            end
        else 
            HORIZONTAL_DIRS.each do |horizontal_move|
                moves += grow_unblocked_moves_in_dir(horizontal_move)
            end
            DIAGONAL_DIRS.each do |horizontal_move|
                moves += grow_unblocked_moves_in_dir(horizontal_move)
            end
            
        end

        moves

    
  
      # iterate over each of the directions in which a slideable piece can move
        # use the Piece subclass' `#move_dirs` method to get this info
        # for each direction, collect all possible moves in that direction
          # and add them to your moves array 
          # (use the `grow_unblocked_moves_in_dir` helper method)
  
      # return the final array of moves (containing all possible moves in all directions)
    end
  
  
    private
  
    def move_dirs
      # subclass implements this
      raise NotImplementedError # this only executes if the subclass does not have a move_dirs method
    end
  
  
    # this helper method is only responsible for collecting all moves in a given direction
    # the given direction is represented by two args, the combination of a dx and dy
    def grow_unblocked_moves_in_dir(dx, dy)
      # create an array to collect moves
        collected_moves = []
      # get the piece's current row and current column
        cx, cy = pos

        until !(cx + dx).between?(0, 7) || !(cy + dy).between?(0, 7) 
            # cx, cy = new_pos 
            new_pos = [cx + dx, cy + dy]
            if !board[new_pos].nil? || board[new_pos] == our_piece
                break
            elsif !board[new_pos].nil? && board(new_pos) == enemys_piece
                collected_moves << [cx + dx, cy + dy]
                break
            else
                collected_moves << [cx + dx, cy + dy]
            end
                
            cx += dx
            cy += dy
        end


      # in a loop:
        # continually increment the piece's current row and current column to generate a new position
        # stop looping if the new position is invalid (not on the board); the piece can't move in this direction
        # if the new position is empty, the piece can move here, so add the new position to the moves array
        # if the new position is occupied with a piece of the opposite color, the piece can move here (to capture the opposing piece), so add the new position to the moves array
          # but, the piece cannot continue to move past this piece, so stop looping
        # if the new position is occupied with a piece of the same color, stop looping
  
      # return the final moves array
    end
  end
  
  
  
  
  # Note: you can invoke methods from the piece from within the module methods, and vice versa. It is a two way street!