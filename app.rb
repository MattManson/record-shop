require('sinatra')
require('sinatra/contrib/all')
require_relative('./controllers/album_controller.rb')
require_relative('./controllers/artist_controller.rb')

get '/' do
  @albums = Album.all()
  @artists = Artist.all()
  erb :index
end

get '/result' do
  @result = params['search'].capitalize
  @result_artist = Artist.search_artist(@result)
  @result_album = Album.search_album(@result)
  @result_genre = Artist.search_genre(@result)
  erb(:result)
end
