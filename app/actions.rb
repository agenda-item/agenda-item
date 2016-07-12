# Homepage (Root path)
get '/' do
  erb :index
end

get '/styleguide' do
  erb :styleguide
end

get '/meetings' do
  

  erb :meetings
end

get '/api/meetings' do
 content_type :json
 Meeting.all.to_json
end

get '/api/agenda-items' do
 content_type :json
 AgendaItem.all.to_json
end