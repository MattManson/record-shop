require( 'sinatra' )
require( 'sinatra/reloader')
require('pry-byebug')
require_relative('../models/album.rb')
require_relative('../models/artist.rb')

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

delete '/album/:id' do
  album =Album.find(params[:id])
  album.delete
  redirect to('/')
end

get '/album/:id/edit' do
  @album = Album.find( params[:id] )
  @artist = Artist.all
  erb( :"album/edit" )
end

put '/album/:id' do
  Album.new( params ).update
  redirect to '/'
end
