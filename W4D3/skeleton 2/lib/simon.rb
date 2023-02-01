class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    while !self.game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    if !self.game_over
      round_success_message
      self.sequence_length += 1
    end
    sleep(1)
  end

  def show_sequence
    add_random_color
    self.seq.each do |color|
      puts color
      sleep(1)
      system("clear")
      puts "------"
      sleep(0.5)
      system("clear")
    end
  end

  def require_sequence
    user_answer = []
    i = 0
    self.sequence_length.times do
      puts "Enter the next color in the sequence. Press return after each color."
      user_answer << gets.chomp
      system("clear")
      if user_answer != self.seq[0..i]
        self.game_over = true
        return
      end
      i += 1
    end
  end

  def add_random_color
    self.seq << COLORS.sample
  end

  def round_success_message
    puts "Round success"
  end

  def game_over_message
    puts "Game over"
  end

  def reset_game
    self.sequence_length = 1
    self.game_over = false
    self.seq = []
  end
end

# game = Simon.new
# game.play