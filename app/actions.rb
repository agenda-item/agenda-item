# Landing Page
get '/' do
  erb :index
  # redirect '/organizations/new'
end

# Style Guide
get '/styleguide' do
  erb :styleguide
end

get '/organizations/new' do
	erb :signup
end

get '/test' do
  erb :agendaitem
end

get '/select' do 
  erb :select_status
end

#################
# FILE UPLOADER #
#################

get "/files-upload" do
  @files = Dir["./public/files/*"]
  erb :file_upload
end
 
post '/agenda-items/3/save_file' do
  @filename = params[:file][:filename]
  file = params[:file][:tempfile]
  if File.exists? "./public/files/#{@filename}" then
    "File with this name exists already!"
  else
    @agenda_item = AgendaItem.find(3)
    @agenda_item.file_path = @filename
    if @agenda_item.save
      puts @agenda_item.file_path
      puts "inside save"
    end  
    File.open("./public/files/#{@filename}", 'wb') do |f|
      f.write(file.read)
    end
    "File uploaded"
  end
end

get "/public/files/:file" do
  send_file File.open("./public/files/#{params[:file]}")
end

#################
# ORGANIZATIONS #
#################

# list all organizations
get '/organizations' do
  erb :organizations
end

# get all organizations
get '/api/organizations' do
  content_type :json
  Organization.all.to_json
end

# get organization by id
get '/api/organizations/:id' do |id|
  content_type :json
  Organization.find(id).to_json
end

############
# MEETINGS #
############

# list all meetings
get '/meetings' do
  erb :meetings
end

# get all meetings
get '/api/meetings' do
  content_type :json
  Meeting.all.to_json
end

# get meeting by id
get '/api/meetings/:id' do |id|
  content_type :json
  Meeting.find(id).to_json
end

################
# AGENDA ITEMS #
################

# list all organizations
get '/agenda-items' do
  erb :agenda_items
end

# list all agenda items
get '/api/agenda-items' do
 content_type :json
 AgendaItem.all.to_json(include: { :votes => {:include =>:voting_user} })
end

# get agenda item by id
get '/api/agenda-items/:id' do |id|
  content_type :json
  AgendaItem.find(id).to_json(include: { :votes => {:include =>:voting_user} })
end

# create new agenda item by id

# update/edit item by id
post '/api/agenda-items/:id' do |id|
  content_type :json
  @agenda_item = AgendaItem.find(id)
  @agenda_item.title = params[:title]
  @agenda_item.description = params[:description]
  @agenda_item.discussion = params[:discussion]
  @agenda_item.status = params[:status]
  if @agenda_item.save
    puts params[:discussion]
    puts "inside save"
    @agenda_item.to_json(include: { :votes => {:include =>:voting_user} })
  end
end

#########
# USERS #
#########

# list all organizations
get '/users' do
  erb :users
end

# get all users
get '/api/users' do
 content_type :json
 User.all.to_json(include: { :meetings => {:include =>:agenda_items} })
end

# get user by id
get '/api/users/:id' do |id|
  content_type :json
  User.find(id).to_json(include: { :meetings => {:include =>:agenda_items} })
end

#########
# VOTES #
#########

# list all organizations
get '/votes' do
  erb :votes
end

# get all votes
get '/api/votes' do
  content_type :json
  Vote.all.to_json
end

# get vote by id
get '/api/votes/:id' do |id|
  content_type :json
  Vote.find(id).to_json
end

#####################
# MEETING ATTENDEES #
#####################

# list all organizations
get '/meeting-attendees' do
  erb :meeting_attendees
end

# get all meeting attendees
get '/api/meeting-attendees' do
  content_type :json
  MeetingAttendee.all.to_json
end

# get meeting attendee by id
get '/api/meeting-attendees/:id' do |id|
  content_type :json
  MeetingAttendee.find(id).to_json
end
