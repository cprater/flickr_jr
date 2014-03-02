get '/' do
  @users = User.all
  @photos = Photo.order("created_at desc")
  erb :index
end

get '/new' do  
  erb :new
end

get '/new/album' do 
  erb :new_album
end

get '/profile/:user_id' do 
  @user = User.find(params[:user_id])
  @photos = @user.photos

  erb :profile
end

get '/new/:album_id/photos' do 
  @album = Album.find(params[:album_id])
  @photos = User.find(session[:current_user]).photos
  erb :edit_album
end



#POST================================================
post '/login' do 
  user = User.find_by_name(params[:name])
  if user.authenticate(params[:password])
    session[:current_user] = user.id
    redirect "/profile/#{user.id}"
  else
    @error = true
    erb :index
  end
end

post '/new/photo' do
  photo = Photo.new(params[:photo])
  @user = User.find(session[:current_user]) if session[:current_user]
  if photo.save
    @user.photos  << photo if @user
    redirect to '/'
  else
    erb :new
  end
end

post '/new/album' do 
  album = Album.create(name: params[:name])
  redirect "/new/#{album.id}/photos"
end

post '/new/album/photos' do 

  binding.pry
  content_type :json

  album = Album.find(session[:current_album])
  selected_photos = params[:photos]

  selected_photos.to_json
  # selected_photos.each do |photo|
  #   album.photos << photo
  # end

end


