# Homepage (Root path)
get '/' do
  erb :index
end

get '/styleguide' do
  erb :styleguide
end

get '/organizations/new' do
	erb :signup
end