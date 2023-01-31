class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) {Array.new}
    @player1 = name1
    @player2 = name2
    place_stones
  end

  def place_stones
    ((0...6).to_a + (7...13).to_a).each do |i|
      4.times { @cups[i] << :stone}
    end
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos > 13 || start_pos < 0
    raise "Starting cup is empty" if @cups[start_pos].length == 0
  end

  def make_move(start_pos, current_player_name)
    in_hand = []
    @cups[start_pos].length.times {in_hand << @cups[start_pos].pop}
    cup_idx = start_pos
    while !in_hand.empty?
      cup_idx = (cup_idx + 1) % 14
      if !(cup_idx == 6 && current_player_name == @player2) &&
      !(cup_idx == 13 && current_player_name == @player1)
        @cups[cup_idx] << in_hand.pop
      end
    end
    self.render
    return next_turn(cup_idx)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    elsif @cups[ending_cup_idx].length == 1
      return :switch
    else
      return ending_cup_idx
    end    
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if (0..5).all? { |i| @cups[i].empty?}
    return true if (7..12).all? { |i| @cups[i].empty?}
    false
  end

  def winner
    case @cups[6] <=> @cups[13]
    when -1
      return @player2
    when 1
      return @player1
    when 0
      return :draw
    end
  end
end
