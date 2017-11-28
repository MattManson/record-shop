require('pry-byebug')
require_relative('../models/album.rb')
require_relative('../models/artist.rb')

get '/album' do
  @albums = Album.all()
  erb(:"album/index")
end

get '/album/new' do
  @albums = Album.all
  @artists = Artist.all
  erb (:"album/new")
end

post '/album' do
  @album = Album.new(params)
  @album.save()
  redirect to ('/')
end
