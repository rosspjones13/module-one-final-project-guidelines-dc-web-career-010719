require_relative "../config/environment.rb"
require 'uri'

class Api
	attr_accessor :all_character_data, :wanted_data

	def get_all_characters
    @all_character_data = []
    url = "https://superheroapi.com/api.php/<api key>/"
    uri = URI.parse(url)
    for i in 1..100
      data = uri + "#{i}"
      response = Net::HTTP.get_response(data)
      self.all_character_data << JSON.parse(response.body)
      # binding.pry
		end
		take_data_from_all
	end

	def take_data_from_all
		@wanted_data = []
		self.all_character_data.each do |char|
			@wanted_data << {
				id: char["id"],
        name: char["name"],
				power: char["powerstats"]["power"].to_i, 
				combat: char["powerstats"]["combat"].to_i, 
				alignment: char["biography"]["alignment"], 
				image: char["image"]["url"]
			}
		end
	end

	def separate_data(alignment)
		self.wanted_data.select do |char|
			char[:alignment] == alignment
		end
	end

	def create_super
		separate_data('good').each do |s|
			Superhero.find_or_create_by(name: s[:name], power: s[:power], combat: s[:combat], img: s[:image])
		end
	end

	def create_villain
		separate_data('bad').each do |s|
			Villain.find_or_create_by(name: s[:name], power: s[:power], combat: s[:combat], img: s[:image])
		end
	end

end


# a = Api.new
# a.get_all_characters
# a.create_villain
# a.create_super
# # binding.pry
# # 0