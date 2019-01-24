require 'rest-client'
require 'json'
require 'pry'

class Api
	attr_accessor :all_character_data, :wanted_data, :superhero_data, :villain_data
	# attr_reader :return_data
	@@superhero_arr = []

	def initalize
		# @character_data = []
	end

	def get_all_characters
		@all_character_data = []
		for i in 1..5
			data = RestClient.get("https://superheroapi.com/api.php/10217955407538799/#{i}")
			self.all_character_data << JSON.parse(data)
		end
		# puts self.all_character_data
		take_data_from_all
		# puts @wanted_data
		separate_data
		puts @superhero_data
		puts @villain_data
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

	def separate_data
		@superhero_data = []
		@villain_data = []
		self.wanted_data.each do |char|
			if char[:alignment] == "good"
				@superhero_data << char
			else
				@villain_data << char
			end
		end
	end

	def create_super
		@superhero_data.each do |s|
			binding.pry
			Superhero.new(name)
		end
	end
end

a = Api.new
a.get_all_characters
a.create_super
binding.pry
0