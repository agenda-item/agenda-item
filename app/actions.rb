require_relative "utils"

# Landing Page
get '/' do
  erb :index
end

# Style Guide
get '/styleguide' do
  erb :styleguide
end

####################
# NEW ORGANIZATION #
####################

get '/organizations/new' do
	erb :signup
end

#####################
# NEW BOARD MEMBERS #
#####################

#Board Members Sign Up page
get '/users/new' do
  erb :board_members
end

# create new board member (user)
post '/users/new' do 
  email = params[:email]
  first_name = params[:first_name]
  last_name = params[:last_name]
  board_position = params[:board_position]
  redirect(to('/users/new')) 
end

get '/edit-meeting' do
  erb :edit_meeting
end

#################
# FILE UPLOADER #
#################

post '/agenda-items/3/save_file' do
  @filename = params[:file][:filename]
  message = ""
  if is_valid_filename(@filename)
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
      message = "File has been uploaded"
    end
  else
    message = "Error uploading file, please retry"
  end
  message
end

get "/public/files/:file" do
  send_file File.open("./public/files/#{params[:file]}")
end

#################
# ORGANIZATIONS #
#################

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

# show a meeting
get '/meetings/:id' do
	erb :meetings_show 
end

# list all meetings
get '/meetings' do
  erb :list_meetings
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

# delete a meeting
get '/api/meetings/:id/delete' do
  content_type :json
  @meeting = Meeting.find(params[:id])
  @meeting.destroy
  if @meeting.destroy
    puts "meeting has been removed from existence! MWAAAHAHAHA"
  end
end

# # create a new meeting (placeholder route)
# get '/meetings/new' do
#   content_type :json
#   @meeting = Meeting.new
# end

get '/logout' do
  redirect '/'
end

################
# AGENDA ITEMS #
################

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

# JEN HAS THIS ROUTE

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
