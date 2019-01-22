class CLI
  attr_accessor :todays_hero, :enemy

  def self.welcome
    puts "Welcome to Super Fight Bros\n\n"
  end

  def self.get_todays_hero
    puts "Who do you want to be today?"
    @todays_hero = gets.chomp
    Superhero.find_by(name: @todays_hero)
  end

  def self.display_menu
    puts "What would you like to do?
  ***************************
  1. Start a fight
  2. Exit"
  self.start_game_loop
  end

  def self.start_game_loop
    input = gets.chomp.to_i
    while
      input != 2
      case input
      when 1
        start_battle
      else
        display_menu
        break
      end
      binding.pry
    end
  end

  def self.start_battle
    puts "Who would you like to battle?"
    @enemy = gets.chomp
    battle(superhero: @todays_hero, villain: @enemy)
  end

  # def get_input
  #   @last_input = gets.chomp
  # end

end