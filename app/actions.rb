helpers do
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end

# Homepage (Root path)
get '/' do #Note the get '/' is our HTTP request
  erb :index 
end

get '/register' do
  @user = User.new
  erb :register
end

post '/register' do
  user = User.new(
    email: params[:email],
    password: params[:password]
    )
  if user.save
    session[:user_id] = user.id
    #flash[:notice] = "Welcome to the Music Wall #{params[:email]}"
    redirect '/tracks'
  else
    erb :register
  end
end

get '/login' do
  @user = User.new
  erb :login
end


post '/login' do
  user = User.find_by email: params[:email]
  if user
    if user.password == params[:password]
      session[:user_id] = user.id
      redirect '/tracks'
    end
  end
  erb :login
end

get '/logout' do
  session[:user_id] = nil
  redirect '/tracks'
end


get '/tracks' do
  @tracks = Track.all
  erb :'tracks/index'
end

get '/tracks/new' do
  @track = Track.new
  erb :'tracks/new'
end

get '/tracks/:id' do
  @track = Track.find(params[:id])
  erb :'tracks/show'
end


post '/tracks' do
  track = Track.new(
    title: params[:title],
    author: params[:author],
    url: params[:url],
    user_id: current_user.id
    )
  if track.save
    redirect '/tracks'
  else
    erb :'tracks/new'
  end
end

post '/upvotes' do
  track_id = params[:track_id]
  vote = Upvote.new(
    user_id: current_user.id,
    track_id: track_id
    )
  vote.save
  redirect '/tracks'
end

post '/reviews' do
  track_id = params[:track_id]
  review = Review.new(
    user_id: current_user.id,
    track_id: track_id,
    content: params[:content]
    )
  review.save
  redirect(back)
end

delete '/review/:id' do
  @review = Review.find(params[:id])
  @review.destroy
  redirect(back)
  # review = Review.find(params[:id])
  # puts review
  # destroy review
end
