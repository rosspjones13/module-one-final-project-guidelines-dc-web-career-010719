class Superhero < ActiveRecord::Base
  has_many :fights
  has_many :villains, through: :fights

#increases superhero's power by ten and saves to the database. Power does not go over 100.
  def train
    system "clear"
    self.power += 2
    if self.power >= 100
      self.power = 100
    end
    self.save
    puts "Your power is now #{self.power}.\n\n"
  end

#Displays tips for the user
  def display_tips
    ["Consider training or joining a quest to increase your power.", 
    "Consider fighing a weaker opponent to increase your combat."].sample
  end

#Displays the hero's combat and power levels
  def display_stats
    puts "Power: #{self.power}. Combat: #{self.combat}"
    if self.power < 50 || self.combat < 50
      puts display_tips
    elsif
      puts "Do not be afraid of your power. Start a new challenge."
    end
  end

  #Helper method to increase the hero's power based on the outcome of the quest
  def increase_power_by(power_update)
    self.power += power_update
  end
  # self.save
end