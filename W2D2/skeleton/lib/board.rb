require_relative 'mancala'
require_relative 'player'
require "byebug"

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @opp_player_cup = {
      name1 => 13,
      name2 => 6
    }
    @cups = Array.new(14) { [] }
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    self.cups.each_index do |idx|
      next if [13, 6].include?(idx)
      self.cups[idx] = [:stone] * 4
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos < 1 || start_pos > 14
  end

  def make_move(start_pos, current_player_name)
    opp_cup = @opp_player_cup[current_player_name]
    num_stones = self.cups[start_pos].length
    self.cups[start_pos] = []
    current = start_pos
    while num_stones > 0
      current = (current + 1) % 14
      next if current == opp_cup
      self.cups[current] << :stone
      num_stones -= 1
    end
    self.render
    self.next_turn(current)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if [6, 13].include?(ending_cup_idx)
      :prompt
    elsif self.cups[ending_cup_idx].length == 1
      :switch
    else
    ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  self.cups[0..5].all?(&:empty?) || self.cups[7..12].all?(&:empty?)
  end

  def winner
    case self.cups[13] <=> self.cups[6]
    when 1
      @name2
    when 0
      :draw
    when -1
      @name1
    end
  end
end
