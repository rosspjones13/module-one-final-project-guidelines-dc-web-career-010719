class CLI
  attr_accessor :todays_hero, :enemy

  def self.welcome
    puts "Welcome to Super Fight Bros\n\n"
  end

  def self.get_todays_hero
    puts "Who do you want to be today?"
    input = gets.chomp
    @todays_hero = Superhero.find_by(name: input)
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
        puts "***************************"
        display_menu
        break
      else
        display_menu
        break
      end
    end
  end

  def self.start_battle
    puts "Who would you like to battle?"
    input = gets.chomp
    @enemy = Villain.find_by(name: input)
    battle(superhero: @todays_hero, villain: @enemy)
  end

  # lets the villain say a catchphrase
  def self.catchprases
    puts ["Why so serious?", "Dolts! Such insolence will not go unpunished!", "Peace was never an option.",
    "I did not ask for your trust. I demand only your obedience.", "Regardless of the size of the audience... Always make an entrance... Always Make An Entrance!",
    "I will make you kneel before me!"].sample
  end

  def self.battle(superhero:, villain:)
    self.catchprases
    hero_score = (superhero.power + superhero.combat) + rand(50)
    villain_score = (villain.power + villain.combat) + rand(50)
    self.update_combat(self.declare_winner(hero_score, villain_score) ? superhero : villain)
  end

  def self.declare_winner(hero_score, villain_score)
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

  def self.update_combat(winner)
    winner.combat += 10
  end

  # def get_input
  #   @last_input = gets.chomp
  # end

end
