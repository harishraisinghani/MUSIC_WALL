# Homepage (Root path)
get '/' do #Note the get '/' is our HTTP request
  erb(:index) 
end

get '/wall' do
  'This will be the public music wall'
end
