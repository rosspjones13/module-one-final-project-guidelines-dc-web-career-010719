class CLI
  attr_accessor :todays_hero, :enemy

  def welcome
    puts "Welcome to Super Fight Bros\n\n"
  end

  def get_todays_hero
    puts "Who do you want to be today?"
    input = gets.chomp
    @todays_hero = Superhero.find_by(name: input)
  end

  def display_menu
    puts "Hi #{@todays_hero.name}! What would you like to do?"
    puts "***************************"
    puts "1. Start a fight"
    puts "2. Exit"
    self.start_game_loop
  end

  def start_game_loop
    input = gets.chomp
    while
      # input != 2
      case input
      when "1"
        start_battle

      when "2"
        break

      when "Exit"
        break

      when "exit"
        break

      else
        puts "\nSorry, #{input} is not a valid option. Please try again."
        display_menu
      end
    end
  end

  def start_battle
    puts "\n***************************\n"
    puts "\nWho would you like to battle?\n"
    display_villains

    input = gets.chomp
    @enemy = Villain.find_by(name: input)
    battle(superhero: @todays_hero, villain: @enemy)
    display_menu
  end

  # lets the villain say a catchphrase
  def catchprases
    puts ["Why so serious?", "Dolts! Such insolence will not go unpunished!", "Peace was never an option.",
    "I did not ask for your trust. I demand only your obedience.", "Regardless of the size of the audience... Always make an entrance... Always Make An Entrance!",
    "I will make you kneel before me!"].sample
  end

  def battle(superhero:, villain:)
    catchprases
    hero_score = (superhero.power + superhero.combat) + rand(50)
    villain_score = (villain.power + villain.combat) + rand(50)
    update_combat(declare_winner(hero_score, villain_score) ? superhero : villain)
  end

  def declare_winner(hero_score, villain_score)
    puts "Hero score: #{hero_score}"
    puts "Villain score: #{villain_score}"
    if hero_score > villain_score
      puts "The hero has vanquished the villain!"
      return true
    else
      puts "The hero has fallen, evil is victorious!"
      return false
    end
  end

  def update_combat(winner)
    winner.combat += 10
  end

def display_villains
  #displays the villains leaderboard by power
  Villain.order(power: :desc).each do |villain|
    puts "#{villain.name} | Power: #{villain.power} | Combat: #{villain.combat}"
  end
end

end
