# Homepage (Root path)
get '/' do
  erb :index
end

get '/styleguide' do
  erb :styleguide
end

get '/test' do
  erb :tile
end

get '/styleguide' do
  erb :styleguide
end
