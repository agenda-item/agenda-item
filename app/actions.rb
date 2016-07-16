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
  erb :edit_meeting
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
  @agenda_item.discussion = params[:discussion]
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