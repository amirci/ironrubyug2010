require 'rubygems'
require 'sinatra'
require 'haml'
require 'singleton'

require File.dirname(__FILE__) + "/../main/MavenThought.MovieLibrary/bin/Debug/MavenThought.MovieLibrary.dll"
include MavenThought::MovieLibrary

class Library
	include Singleton
end

# index
get '/' do
  @movies = Library.instance.contents
  haml :index
end

# create
post '/' do
  m = Movie.new(params[:title])
  Library.instance.add m
  redirect '/'
end