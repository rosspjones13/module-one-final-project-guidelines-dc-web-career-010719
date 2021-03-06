class Fight < ActiveRecord::Base
  belongs_to :villain
  belongs_to :superhero

#Starts a battle sequence and calls helper methods display_villains, battle, declare_winner, and update_combat
  def start_battle(todays_hero)
    system "clear"
    puts "\n***************************\n"
    display_villains
    # battle(superhero: todays_hero, villain: Villain.find_by(id: villain_id))
  end

#Performs the battle mechanics and calls declare_winner and update_combat
  def battle(superhero:, villain:)
    villain.catchprases
    hero_score = (superhero.power + superhero.combat) + rand(50)
    villain_score = (villain.power + villain.combat) + rand(50)
    if declare_winner(hero_score, villain_score)
      update_combat(superhero, villain)
    else
      update_combat(villain, superhero)
    end
    superhero.save
    self.save
 	end

# displays both scores then declares the winner and returns a boolean
  def declare_winner(hero_score, villain_score)
    puts "\n***************************\n"
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

# updates both winner and losers combat and displays
  def update_combat(winner, loser)
    winner.combat += 10
    winner.combat = 100 if winner.combat > 100
    loser.combat -= 10
    loser.combat = 0 if loser.combat < 0
    puts "#{winner.name}'s combat has increased by 10! It is now #{winner.combat}."
    puts "#{loser.name}'s combat has decreased by 10! It is now #{loser.combat}.\n\n"
    puts "***************************\n"
    winner.save
    loser.save
  end

  # displays the villains leaderboard by power
  def display_villains
    villain_array = Villain.order(power: :desc).map do |villain|
      "#{villain.name} | Power: #{villain.power} | Combat: #{villain.combat}"
    end
    selection = TTY::Prompt.new.select("Who would you like to battle?", villain_array, 
      per_page: 30, filter: true, cycle: true)
    selection = Villain.find_by(name: selection.split(" | ").first)
    self.villain = selection
  end
end
