# Homepage (Root path)
get '/' do
  erb :index
end

get '/styleguide' do
  erb :styleguide
end


get '/test1' do
  erb :document
end

get '/test2' do
  erb :business
end
get '/test3' do
  erb :election
end
get '/test4' do
  erb :meeting_details
end
get '/test5' do
  erb :motion
end
