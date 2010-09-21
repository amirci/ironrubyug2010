require File.dirname(__FILE__) + "/../main/MavenThought.MovieLibrary/bin/Debug/MavenThought.MovieLibrary.dll"

require 'rubygems'

include MavenThought::MovieLibrary

# Extend library to use enumerable
class Library
	include Enumerable
	
	def each(&block)
		contents.each &block
	end
end


l = Library.new

l.add Movie.new("Blazing Saddles")
l.add Movie.new("Young Frankenstein")
l.add Movie.new("Spaceballs")

puts "Are all release date nil? #{l.all? { |m| m.release_date.nil? }}"
puts "Which movie titles do we have? #{l.collect { |m| m.title.to_upper + ' - ' } }"
puts "Any movie starts with 'Blazing'? #{ l.any? { |m| m.title =~ /Blazing/ } }"

