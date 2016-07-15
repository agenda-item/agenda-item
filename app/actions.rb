# Homepage (Root path)
get '/' do
  erb :index
  # redirect '/organizations/new'
end

get '/styleguide' do
  erb :styleguide
end

get '/organizations/new' do
	erb :signup
end

get '/test' do
  erb :motion
end
