class Superhero < ActiveRecord::Base
  has_many :fights
  has_many :villains, through: :fights
end