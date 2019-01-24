class Villain < ActiveRecord::Base
  has_many :fights
  has_many :superheros, through: :fights

	# lets the villain say a catchphrase
  def catchprases
    puts ["\"Why so serious?\"", "\"Dolts! Such insolence will not go unpunished!\"", "\"Peace was never an option.\"",
    "\"I did not ask for your trust. I demand only your obedience.\"", "\"Regardless of the size of the audience... Always make an entrance... Always Make An Entrance!\"",
    "\"I will make you kneel before me!\""].sample
  end
end
