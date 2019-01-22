class Fight < ActiveRecord::Base
  belongs_to :villain
  belongs_to :superhero
end
