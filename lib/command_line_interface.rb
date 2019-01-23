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
    prompt = TTY::Prompt.new
    puts "Hi #{@todays_hero.name}!"
    puts "***************************"
    selection = prompt.select("What would you like to do?") do |menu|
      menu.choice 'Start a fight', 1
      menu.choice 'Train for battle', 2
      menu.choice 'Display Stats', 3
      menu.choice 'Display Instructions', 4
      menu.choice 'Exit', 5
    end
    self.start_game_loop(selection)
  end

  def start_game_loop(selection)
    case selection
    when 1
      new_fight = Fight.new(superhero: todays_hero, villain: enemy)
      new_fight.start_battle(todays_hero)
    when 2
      @todays_hero.train
    when 3
      @todays_hero.display_stats
    when 4
      display_instructions
    when 5
      return      
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

end
