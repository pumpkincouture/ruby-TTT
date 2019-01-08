class Board
  attr_accessor :cells

  def initialize(size)
    @size = size
    @cells = Array.new(size * size, []);
  end

  def place_move(space, marker)
    move = convert_move(space)
    cells[move] = marker
  end

  def occupied_spaces
    cells.select { |cell| !cell.empty? }
  end

  def open_spaces
    spaces = []
    cells.each_with_index do |sub_array, idx|
      spaces << idx if sub_array.empty?
    end
    spaces
  end

  def full?
    open_spaces.length <= 0
  end

  def clear_cell(cells, move)
    cells[move] = []
  end

  def cells_marked_with(marker, cells)
    spaces = []
    cells.each_with_index do |cell, idx|
      spaces << idx if cell == marker
    end
    spaces
  end

  def display_row
    get_board_row
  end

  def get_board_row
    get_row = cells.each_slice(@size).to_a
  end

  private

  def convert_move(chosen_space)
    chosen_space.to_i - 1
  end

end
