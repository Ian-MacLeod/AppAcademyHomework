require "byebug"

class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    self.take_turn until self.game_over
    self.game_over_message
    self.reset_game
  end

  def take_turn
    self.show_sequence
    self.require_sequence
    unless self.game_over
      self.round_success_message
      self.sequence_length += 1
    end
  end

  def show_sequence
    self.add_random_color
    puts "Remember this!"
    sleep(1)
    system("clear")
    self.seq.each do |color|
      puts color
      sleep(1)
      system("clear")
      sleep(0.5)
    end
  end

  def get_color
    puts "Enter the next color in the sequence"
    color = gets.chomp
    until self.class::COLORS.include?(color)
      puts "Invalid color, try again"
      color = gets.chomp
    end
    color
  end

  def require_sequence
    self.seq.each do |color|
      user_color = self.get_color
      self.game_over = true if user_color != color
    end
  end

  def add_random_color
    self.seq << self.class::COLORS.sample
  end

  def round_success_message
    puts "Correct!"
  end

  def game_over_message
    puts "You remembered #{self.sequence_length - 1} colors"
  end

  def reset_game
    self.sequence_length = 1
    self.game_over = false
    self.seq = []
  end
end

if $PROGRAM_NAME == __FILE__
  Simon.new.play
end
