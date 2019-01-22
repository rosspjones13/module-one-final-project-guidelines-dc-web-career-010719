class Villain < ActiveRecord::Base
  has_many :fights
  has_many :superheros, through: :fights

  def catchprases
    return ["Why so serious?", "Dolts! Such insolence will not go unpunished!", "Peace was never an option.",
    "I did not ask for your trust. I demand only your obedience.", "Regardless of the size of the audience... Always make an entrance... Always Make An Entrance!",
    "I will make you kneel before me!"]
  end

  def battle(:superhero, :villain)
    villain.catchprases
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
  # lets the villain say a catchphrase
  def say_catchphrase
    puts catchprases.sample
  end
end
