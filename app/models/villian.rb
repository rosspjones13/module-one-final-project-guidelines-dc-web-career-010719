class Villain < ActiveRecord::Base
  has_many :fights
  has_many :superheros, through: :fights
end