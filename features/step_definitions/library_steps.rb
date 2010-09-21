require File.dirname(__FILE__) + "/../../main/MavenThought.MovieLibrary/bin/Debug/MavenThought.MovieLibrary.dll"

include MavenThought::MovieLibrary

Given /^I have an empty library$/ do
  @lib = Library.new
end

When /^I add the following movies:$/ do |table|
  table.hashes.each do |row|
    movie = Movie.new row[:title], System::DateTime.parse(row[:release_date])
	@lib.add movie
  end
end

Then /^The library should have (.*) movies$/ do |count|
  @lib.contents.count.should == count.to_i
end

Then /^"([^\"]*)" should be in the list$/ do |title|
  @lib.contents.find( lambda { |m| m.title == title } ).should_not be_nil
end