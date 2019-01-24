require 'pry'

class CLI
  attr_accessor :todays_hero, :enemy


  def welcome
    system "clear"
    title_print
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
    title_print
    new_user = TTY::Prompt.new.yes?("Would you like to create a new character?") do |q|
      q.positive 'Yes'
      q.negative 'No'
      q.convert -> (input) { !input.match(/^agree$/i).nil?}
    end
    if new_user
      @todays_hero = create_new_player
    else
      select_hero = TTY::Prompt.new.select("Who would you like to be today?", Superhero.all.map(&:name), 
        per_page: 15, filter: true)
      @todays_hero = Superhero.find_by(name: select_hero)
    end
  end

  def display_menu
    title_print
    puts "Hi #{@todays_hero.name}!"
    puts "***************************"
    selection = TTY::Prompt.new.select("What would you like to do?", per_page: 10, cycle: true) do |menu|
      menu.enum '>'

      menu.choice 'Start a fight', 1
      menu.choice 'Train for battle', 2
      menu.choice 'Display Stats', 3
      menu.choice 'Display Instructions', 4
      menu.choice 'Display Leaderboard', 5
      menu.choice 'Show Image', 6
      menu.choice 'Exit', 7
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
      display_board
    when 6
      print_picture("batman.jpg")
    when 7
      return      
    end
    display_menu
  end

  def parse_players(player)
    # binding.pry
    #displays the superhero leaderboard by combat
    board = player.each_with_index.map do |s, i|
      [i+1, s.name, s.power, s.combat]
    end
  end

  def display_board
    system "clear"
    header = ['#', 'Player', 'Power', 'Combat']
    rows = parse_players(Superhero.order(combat: :desc))
    table = TTY::Table.new header, rows
    puts table.render(:unicode)
  end

  def create_new_player
    hero_name = TTY::Prompt.new.ask('What is your Superhero\'s name?', default: 'Anonymous')
    Superhero.new(name: hero_name)
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
    title_print
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

  def title_print
    title = Artii::Base.new :font => 'slant'
    puts title.asciify('Super Fight Bros.').colorize(:red)
  end

  def print_picture(image)
    system "clear"
    Catpix::print_image image,
      :limit_x => 0.5,
      :limit_y => 0,
      :center_x => true,
      :center_y => false,
      :bg => "black",
      :bg_fill => false,
      :resolution => "high"
  end

end
