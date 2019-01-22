class Superhero < ActiveRecord::Base
  has_many :fights
  has_many :villains, through: :fights

  def train
  #increases superhero's power by ten and saves to the database. Power does not go over 100.
    self.power += 10
    if self.power >= 100
      self.power = 100
    end
    self.save
    puts "Your new power is  now #{self.power}."
  end
end