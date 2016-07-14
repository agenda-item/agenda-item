# Landing Page
get '/' do
  erb :index
end

# Style Guide
get '/styleguide' do
  erb :styleguide
end

get '/organizations/new' do
  erb :signup
end
