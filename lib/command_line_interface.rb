require 'pry'

class CLI
  attr_accessor :todays_hero, :enemy

  def welcome
    
    system "clear"
    puts "Welcome to Super Fight Bros. The goal of this game is to become the ultimate fight master.
When you create a new user, your Power  and Combat are automatically set at 25. Through a series of
fights, quests, and tournaments, you can increase these attributes to win more fights and climb the
leader board! Do you think you have what it takes to top the leader board?\n\n"
    begin 
      puts "Please press C to continue"
    end while !input_check("C")
  end

  def set_todays_hero
    system "clear"
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
    puts "4. Display Instructions"
    puts "5. Exit"
    self.start_game_loop
  end

  def start_game_loop
    input = gets.chomp.upcase
    # while input.upcase != "EXIT"
    case input
    when "1"
      start_battle
      

    when "2"
      @todays_hero.train
      

    when "3"
      @todays_hero.display_stats
      
    when "4"
      display_instructions
      
    when "EXIT"
      return
    else
      puts "\nSorry, #{input} is not a valid option. Please try again or enter Exit to end program."
      
    end
    display_menu
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

  def input_check(check)
    input = gets.chomp.upcase
    if input == check
      system "clear"
      true
    else
      false
    end
  end

  def display_instructions
    system "clear"
    puts "Instructions:\n"
    puts "Fights: Increase your combat score by initiating fights with villains.\n\n"
    puts "Quests: Boost your power score and increase your chances of winning ore fights by going on a quest.
The more scenarios you pass, the more your power increases, but beware! If you fail a quest, your power
shall PLUMMET!\n\n"
    puts "Tournaments: In a series of three fight sequences, the true winner shall prevail. This challenge is
not for the faint of heart. Join a tournament and broadcast your glory for all the world to see.\n\n"
    begin 
      puts "Please press M to go back to the menu"
    end while !input_check("M")
  end


  def run_quest
    Quest.show_quests
    journey = Quest.find_quest
    power_update = journey.play_quest
    @todays_hero.increase_power_by(power_update)
  end

end
