# require_relative "../config/environment.rb"

# class Api
# 	attr_accessor :all_character_data, :wanted_data

# 	def get_all_characters
# 		@all_character_data = []
# 		for i in 149..200
# 			data = RestClient.get("https://superheroapi.com/api.php/<api_here>/#{i}")
# 			self.all_character_data << JSON.parse(data)
# 		end
# 		take_data_from_all
# 	end

# 	def take_data_from_all
# 		@wanted_data = []
# 		self.all_character_data.each do |char|
# 			@wanted_data << {
# 				id: char["id"],
# 				name: char["name"], 
# 				power: char["powerstats"]["power"].to_i, 
# 				combat: char["powerstats"]["combat"].to_i, 
# 				alignment: char["biography"]["alignment"], 
# 				image: char["image"]["url"]
# 			}
# 		end
# 	end

# 	def separate_data(alignment)
# 		self.wanted_data.select do |char|
# 			char[:alignment] == alignment
# 		end
# 	end

# 	def create_super
# 		separate_data('good').each do |s|
# 			Superhero.find_or_create_by(name: s[:name], power: s[:power], combat: s[:combat], img: s[:image])
# 		end
# 	end

# 	def create_villain
# 		separate_data('bad').each do |s|
# 			Villain.find_or_create_by(name: s[:name], power: s[:power], combat: s[:combat], img: s[:image])
# 		end
# 	end

# end


# a = Api.new
# a.get_all_characters
# a.create_villain
# a.create_super
# # binding.pry
# # 0