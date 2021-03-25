require 'bundler/inline'
require 'minitest/autorun'

class ScreenTest < Minitest::Test
  def test_screen
    assert Screen
  end

  def test_grid
    assert_equal Screen::GRID,[["Ryu", "E.Honda", "Blanka", "Guile", "Balrog", "Vega"],
                                  ["Ken", "Chun Li", "Zangief", "Dhalsim", "Sagat", "M.Bison"]]
  end

  def test_initial_player_name
    screen = Screen.new
    assert_equal screen.player, "Ryu"
  end

  def test_update_player
    screen = Screen.new
    screen.update_player(1,2)
    assert_equal screen.player, "Zangief"
  end

  def test_cursor
    assert Cursor
  end

  def test_cursor_coordinates
    cursor = Cursor.new
    assert_equal cursor.row, 0
    assert_equal cursor.column, 0
  end

  def test_cursor_position
    cursor = Cursor.new
    assert_equal cursor.position, [0,0]
  end

  def test_cursor_move_right
    cursor = Cursor.new
    cursor.move_right
    assert_equal cursor.position, [0,1]
  end

  def test_rightmost_constant
    assert_equal Cursor::RIGHTMOST, 5
  end

  def test_cursor_move_from_right_to_left
    cursor = Cursor.new
    cursor.move_manual(0,5)
    cursor.move_right
    assert_equal cursor.position, [0,0]
  end

  def test_cursor_move_from_left_to_right
    cursor = Cursor.new
    cursor.move_left
    assert_equal cursor.position, [0,5]
  end

  def test_leftmost_constant
    assert_equal Cursor::LEFTMOST, 0
  end

  def test_move_left_from_1x3_position
    cursor = Cursor.new
    cursor.move_manual(1,3)
    cursor.move_left
    assert_equal cursor.position, [1,2]
  end

  def test_move_manual_position
    cursor = Cursor.new
    cursor.move_manual(1,1)
    assert_equal cursor.position, [1,1]
    cursor.move_manual(0,4)
    assert_equal cursor.position, [0,4]
  end

  def test_move_up_from_upmost
    cursor = Cursor.new
    cursor.move_manual(0,4)
    cursor.move_up

    assert_equal cursor.position, [0,4]
  end

  def test_move_up_from_downmost
    cursor = Cursor.new
    cursor.move_manual(1,4)
    cursor.move_up

    assert_equal cursor.position, [0,4]
  end

  def test_move_down_from_downmost
    cursor = Cursor.new
    cursor.move_manual(1,3)
    cursor.move_down

    assert_equal cursor.position, [1,3]
  end

  def test_move_up_from_downmost
    cursor = Cursor.new
    cursor.move_manual(0,3)
    cursor.move_down

    assert_equal cursor.position, [1,3]
  end

  def test_maquinita
    assert Maquinita
  end

  def test_maquinita_with_screen_and_cursor
    maquinita = Maquinita.new
    assert_equal maquinita.cursor, Cursor.new
    assert_equal maquinita.screen, Screen.new
  end

  def test_show_screen_grid

  end

  def test_show_input_prompt

  end

  def test_get_input_moves

  end

  def test_render_grid_with_selected_name
    
  end
end

class Cursor
  attr_accessor :row, :column
  LEFTMOST = 0
  RIGHTMOST = 5

  def initialize
    @row, @column = 0,0
  end

  def move_manual(row,column)
    @row = row
    @column = column
  end

  def position
    [@row, @column]
  end

  def move_right
    return @column = 0 if @column == RIGHTMOST
    @column += 1
  end

  def move_left
    return @column = 5 if @column == LEFTMOST
    @column -= 1
  end

  def move_up
    return if @row == 0
    @row -= 1
  end

  def move_down
    return if @row == 1
    @row += 1
  end
end

class Screen
  GRID = [["Ryu", "E.Honda", "Blanka", "Guile", "Balrog", "Vega"],
          ["Ken", "Chun Li", "Zangief", "Dhalsim", "Sagat", "M.Bison"]]

  attr_accessor :player

  def initialize
    @player = GRID[0][0]
  end

  def update_player(row,column)
    @player = GRID[row][column]
  end
end

class Maquinita
  attr_accessor :screen, :cursor

  def initialize
    @screen = Screen.new
    @cursor = Cursor.new
  end

  # def print_grid
  #
  # end
end

gemfile do
  source 'https://rubygems.org'
  gem 'pry'
end

puts 'Gems installed and loaded!'
puts "The nap gem is at version"
