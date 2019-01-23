class Superhero < ActiveRecord::Base
  has_many :fights
  has_many :villains, through: :fights

  def train
  #increases superhero's power by ten and saves to the database. Power does not go over 100.
    system "clear"
    self.power += 10
    if self.power >= 100
      self.power = 100
    end
    # self.save
    puts "Your power is now #{self.power}.\n\n"
  end

  def display_tips
    ["Consider training or joining a quest to increase your power.", "Consider fighing a weaker opponent to increase your combat."].sample
  end

  def display_stats
    system "clear"
    puts "Power: #{self.power}. Combat #{self.combat}"
    if self.power < 50 || self.combat < 50
      puts display_tips
    elsif
      puts "Do not be afraid of your power. Start a new challenge."
    end
  end

  def increase_power_by(power_update)
    self.power += power_update
  end
end