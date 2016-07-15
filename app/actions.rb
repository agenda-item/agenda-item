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

get '/agendaitem' do 
  erb :agendaitem
end

get '/api/agenda-items' do
 content_type :json
 AgendaItem.all.to_json(include: :votes)
end

get '/api/agenda-items/:id' do |id|
  content_type :json
  AgendaItem.find(id).to_json
end

post '/api/agenda-items/:id' do
 content_type :json
 @agenda_item = AgendaItem.find(params[:id])
 @agenda_item.title = params[:title]
 if @agenda_item.save
   puts @agenda_item.title
   @agenda_item.to_json
 end
end

get '/api/users' do
  content_type :json
  User.all.to_json
end

get '/api/users/:id' do
  content_type :json
  User.find(params[:id]).to_json
end

get '/api/votes' do
 content_type :json
 Vote.all.to_json(include: :voting_user)
end