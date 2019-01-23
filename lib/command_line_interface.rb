require 'pry'

class CLI
  attr_accessor :todays_hero, :enemy

  def welcome
    system "clear"
    puts "Welcome to Super Fight Bros\n\n"
  end

  def set_todays_hero
    puts "Who would you like to be today?"
    input = gets.chomp
    @todays_hero = Superhero.find_by(name: input)
  end

  def display_menu
    puts "Hi #{@todays_hero.name}! What would you like to do?"
    puts "***************************"
    puts "1. Start a fight"
    puts "2. Train for battle"
    puts "3. Display Stats"
    puts "4. Exit"
    self.start_game_loop
  end

  def start_game_loop
    input = gets.chomp
      case input
      when "1"
        new_fight = Fight.new(superhero: todays_hero, villain: enemy)
        new_fight.start_battle(todays_hero)
        display_menu
      when "2"
        @todays_hero.train
        display_menu
      when "3"
        @todays_hero.display_stats

      when "4"
        
      when "Exit"

      when "exit"

      else
        puts "\nSorry, #{input} is not a valid option. Please try again."
        display_menu
      end
  end

  def parse_players(player)
    # binding.pry
    #displays the superhero leaderboard by power
    board = player.order(power: :desc).map do |s|
      [s.name, s.power, s.combat]
    end
  end

  def display_board
    header = ['Player', 'Power', 'Combat']
    rows   = parse_players(Superhero)
    table = TTY::Table.new header, rows
    # table.add_separator
    # binding.pry
    # table.style = {:width => 40, :padding_left => 3, :border_x => "=", :border_i => "x"}
    # table.render width: 80, resize: true
  end

  def create_new_player

  end

end
