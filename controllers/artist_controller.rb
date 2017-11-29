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

delete '/artist/:id' do
  artist =Artist.find(params[:id])
  artist.delete
  redirect to('/')
end

get '/artist/:id/edit' do
  @artist = Artist.find( params[:id] )
  erb( :"artist/edit" )
end

put '/artist/:id' do
  Artist.new( params ).update
  redirect to '/'
end
