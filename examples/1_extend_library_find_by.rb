require File.dirname(__FILE__) + "/../main/MavenThought.MovieLibrary/bin/Debug/MavenThought.MovieLibrary.dll"

require 'rubygems'

include MavenThought::MovieLibrary

# Extend library to use method missing to add find_by
class Library

	def method_missing(m, *args)
		if m.id2name.include?( "find_by" )
			field = m.id2name.sub /find_by_/, ""
			contents.find_all( lambda{ |m| m.send(field) == args[0] } )
		else
			super
		end
	end
	
end


l = Library.new

l.add Movie.new('Blazing Saddles', System::DateTime.new(1972, 1, 1))
l.add Movie.new('Spaceballs', System::DateTime.new(1984, 1, 1))

puts "Found the movie #{l.find_by_title 'Spaceballs'}"
puts "Found the movie #{l.find_by_release_date System::DateTime.new(1972, 1, 1)}"
