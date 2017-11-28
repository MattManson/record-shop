require('pry-byebug')
require_relative('../models/album.rb')
require_relative('../models/artist.rb')

get '/artist' do
  @artist = Artist.all()
  erb(:"artist/index")
end

get '/artist/new' do
  @artists = Artist.all
  erb (:"artist/new")
end

get '/artist/:id' do
  @artist = Artist.find(params[:id])
  erb (:"artist/albums")
end

post '/artist' do
  @artist = Artist.new(params)
  @artist.save()
  redirect to ('/artist')
end
