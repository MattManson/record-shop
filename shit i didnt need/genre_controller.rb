require_relative('../models/album.rb')
require_relative('../models/artist.rb')
require_relative('../models/genre.rb')



get '/genres' do
  @genre = Genre.all()
  erb(:"genre/index")
end

get '/genres/new' do
  erb (:"genre/new")
end

post '/genres' do
  genre = Genre.new(params)
  genre.save()
  redirect to ('/artist/new')
end
