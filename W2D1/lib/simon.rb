class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
  end

  def take_turn
    self.add_random_color
    self.sequence_length += 1
    self.show_sequence
    self.require_sequence
    unless self.game_over
      self.round_success_message
    end
  end

  def show_sequence
    system("clear")
    puts "Remember this!"
    sleep(1)
    self.seq.each do |color|
      puts color
      system("clear")
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
      @game_over = true if user_color != color
    end
  end

  def add_random_color
    self.seq.push(self.class::COLORS.sample)
  end

  def round_success_message

  end

  def game_over_message

  end

  def reset_game

  end
end
