require_relative "utils"

helpers do

  def current_organization
    @current_organization ||= Organization.find(session[:organization_id]) if session[:organization_id]
  end

  def current_meeting
    @current_meeting ||= Meeting.find(session["meeting"]) if session["meeting"]
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end

# Landing Page
get '/' do
  erb :index
end

#####################
# LOG IN AND LOGOUT #
#####################

get '/login' do 
  erb :login
end

post '/login' do
  email = params[:email]
  password = params[:password]

  #1. find user by email
  user = User.find_by(email: email)
  
  #2. if that user exists and that user's password matches the password input
    if user && user.authenticate(password)
      #login
      session[:user_id] = user.id
      session[:organization_id] = user.organization.id
      redirect(to('/meetings'))
    else
      flash[:notice] = "Login failed. Please try again."
      redirect '/login'
    end
end

get '/logout' do
  session.clear
  redirect '/'
end

###################
# SIGN UP PROCESS #
###################

# step 1: user email (the get action is '/')
get '/organizations/email' do
  erb :signup, locals: {email: params[:email]}
end

# step 2: user details and organization name
post '/organizations/details' do 
  content_type :json
  email = params[:email]
  name = params[:organization_name]
  first_name = params[:first_name]
  last_name = params[:last_name]
  password = params[:password]

  @organization = Organization.new(
    email: email,
    name: name
  )

  @user = User.new(
    email: @organization.email,
    first_name: first_name,
    last_name: last_name,
    password: password,
    organization: @organization
    )

  if @organization.save && @user.save
    session[:user_id] = @user.id
    session[:organization_id] = @user.organization.id
    puts "this is your org name: #{name}"
    puts "current user: #{first_name} #{last_name}"
    @organization.to_json
    @user.to_json
    redirect(to('/users/new'))
  end
end

#step 3: Board Members Sign Up page
get '/users/new' do
  erb :board_members
end

# create new board member (user)
post '/users/new' do
  first_name = params[:first_name]
  last_name = params[:last_name]
  board_position = params[:board_position]

  @user = User.new(
    first_name: first_name,
    last_name: last_name,
    type: board_position
  )
  if @user.save
    puts "your new board member is: #{first_name} #{last_name}"
    @user.to_json
    redirect(to('/users/new'))
  end  
end

# Style Guide
get '/styleguide' do
  erb :styleguide
end

# Get and post mover data

get '/api/agenda-items/:id/mover' do |id|
  content_type :json
  @agenda_item = AgendaItem.find(id)
  User.find(@agenda_item.mover_id).to_json
end

post '/api/agenda-items/:id/mover' do |id|
  content_type :json
  @agenda_item = AgendaItem.find(id)
  @agenda_item.mover_id = params[:mover_id]
  User.find(params[:mover_id]).to_json
end

# Get and post seconder data

get '/api/agenda-items/:id/seconder' do |id|
  content_type :json
  @agenda_item = AgendaItem.find(id)
  User.find(@agenda_item.seconder_id).to_json
end

post '/api/agenda-items/:id/seconder' do |id|
  content_type :json
  @agenda_item = AgendaItem.find(id)
  @agenda_item.seconder_id = params[:seconder_id]
  User.find(params[:seconder_id]).to_json
end

# Get and post nominee data

get '/api/agenda-items/:id/nominee' do |id|
  content_type :json
  @agenda_item = AgendaItem.find(id)
  User.find(@agenda_item.nominee_id).to_json
end

post '/api/agenda-items/:id/nominee' do |id|
  content_type :json
  @agenda_item = AgendaItem.find(id)
  @agenda_item.seconder_id = params[:nominee_id]
  User.find(params[:nominee_id]).to_json
end

# get and post creator data

get '/api/agenda-items/:id/creator' do |id|
  content_type :json
  @agenda_item = AgendaItem.find(id)
  User.find(@agenda_item.creator_id).to_json
end

post '/api/agenda-items/:id/creator' do |id|
  content_type :json
  @agenda_item = AgendaItem.find(id)
  @agenda_item.creator_id = params[:creator_id]
  User.find(params[:creator_id]).to_json
end
####################
# NEW ORGANIZATION #
####################

get '/organizations/new' do
	erb :signup
end

#########
# USERS #
#########

# get all users
get '/api/users' do
  content_type :json
  users = User.all.where(organization_id: current_organization.id)
  users.to_json(include: :meetings)
end

# get user by id
get '/api/users/:id' do |id|
  content_type :json
  User.find(id).to_json(include: :meetings)
end

#########
# VOTES #
#########

# get all votes
get '/api/votes' do
  content_type :json
  votes = Vote.all.where(organization_id: current_organization.id)
  votes.all.to_json
end

# get vote by id
get '/api/votes/:id' do |id|
  content_type :json
  Vote.find(id).to_json
end

get '/api/agenda-items/:id/votes' do |id|
  content_type :json
  Vote.where(agenda_item_id: id).to_json(include: :voting_user)
end

# TODO this route pattern doesn't match the others, we should probably fix that at some point...
post '/api/votes' do
  content_type :json

  vote = Vote.find(params[:vote_id].to_i)
  vote.vote_type = params[:vote_type]
  
  if vote.save
    puts "saved successfully"
    vote.to_json(include: :voting_user)
  end
end

# Get and post chair data

get '/api/meetings/:id/chair' do |id|
  content_type :json
  @meeting = Meeting.find(id)
  User.find(@meeting.chair_id).to_json
end

post '/api/meetings/:id/chair' do |id|
  content_type :json
  @meeting = Meeting.find(id)
  @meeting.chair_id = params[:chair_id]
  User.find(params[:chair_id]).to_json
end

#################
# FILE UPLOADER #
#################

get "/public/files/:file" do
  send_file File.open("./public/files/#{params[:file]}")
end

post '/agenda-items/:id/save_file' do
  @filename = params[:file][:filename]
  message = ""
  if is_valid_filename(@filename)
    file = params[:file][:tempfile]
    if File.exists? "./public/files/#{@filename}" then
      "File with this name exists already!"
    else
      @agenda_item = AgendaItem.find(params[:id])
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
# create new meeting
post '/api/meetings/new' do
  content_type :json
  meeting = Meeting.new(
    organization_id: current_organization.id
    )
  meeting

  if meeting.save
    session["meeting"] = meeting.id
    meeting.to_json
  else
    flash[:notice] = "Meeting failed to save. Please try again."
  # is this the right route to redirect to?
    redirect '/meetings'
  end
  
end

# edit meeting
get '/meetings/:id/edit' do |id|
  meeting = Meeting.find(id)
  session["meeting"] = meeting.id
  erb :edit_meeting
end

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
  puts current_organization
  meetings = Meeting.all.where(organization_id: current_organization.id)
  meetings.all.to_json
end

# get meeting by id
get '/api/meetings/:id' do |id|
  content_type :json
  meeting = Meeting.find(id)
  session["meeting"] = meeting.id
  meeting.to_json(include: :chair)
end

# gets the current meeting from the helpers
get '/api/current-meeting' do
  content_type :json
  current_meeting.to_json(include: :chair)
end

# update meeting by id
post '/api/meetings/:id' do |id|
  content_type :json
  results = {result: false}

  @meeting = Meeting.find(id)

  # chair field is assigned an object that is found from user id
  @chair = User.find(params[:chair][:id].to_i) if params[:chair]
  @meeting.chair = @chair if params[:chair]

  @meeting.title = params[:title] if params[:title]
  @meeting.description = params[:description] if params[:description]
  @meeting.discussion = params[:discussion] if params[:discussion]
  @meeting.meeting_date = params[:meeting_date] if params[:meeting_date]
  @meeting.location = params[:location] if params[:location]
  @meeting.adjournment_time = params[:adjournment_time] if params[:adjournment_time]
  @meeting.next_meeting_date = params[:next_meeting_date] if params[:next_meeting_date]

  @meeting.save

  if @meeting.save
    results[:result] = true
    @meeting.to_json(include: :chair)
  end
end

# delete a meeting
get '/api/meetings/:id/delete' do
  content_type :json
  @meeting = Meeting.find(params[:id])
  @meeting.destroy
  if @meeting.destroy
    puts "meeting has been deleted"
  end
end

#####################
# MEETING ATTENDEES #
#####################

get '/api/meetings/:id/meeting-attendees' do |id|
  content_type :json
  attendees = []
  found_attendees = MeetingAttendee.where(meeting_id: id)

  if found_attendees.length > 0 then
    found_attendees.each do |attendee|
      attendees.push(attendee) 
    end
    attendees.to_json(include: :user)
  else
    users = User.all.where(organization_id: current_organization.id)
    users.each do |user|
      @attendee = MeetingAttendee.new(
        user_id: user.id,
        attendance_type: 'Absent'
        )
      @attendee.save
      attendees.push(@attendee)
    end
    attendees.to_json(include: :user)
  end
end

post '/api/meetings/:id/meeting-attendees' do |id|
  content_type :json

  attendee = MeetingAttendee.find(params[:attendee_id].to_i)
  attendee.attendance_type = params[:attendance_type]
  
  if attendee.save
    puts "saved successfully"
    attendee.to_json(include: :user)
  else
    puts "not saved"
  end
end

################
# AGENDA ITEMS #
################

# list all agenda items related to the current meeting
get '/api/agenda-items' do
 content_type :json
 AgendaItem.where(meeting_id: current_meeting.id).to_json(include: [:mover, :seconder, :creator, votes: {include: :voting_user}] )

end

# get agenda item by id
get '/api/agenda-items/:id' do |id|
  content_type :json
  AgendaItem.find(id).to_json(include: { :votes => {:include =>:voting_user} })
end

# create new agenda item
post '/api/agenda-items/new' do
  content_type :json
  type = params[:type]

  @agenda_item = AgendaItem.new(
    type: params[:type],
    position: params[:position],
    creator: current_user,
    meeting: current_meeting
    )
  if @agenda_item.save
    puts "the type is #{type}"
    @agenda_item.to_json
  end
end

# update/edit item by id
post '/api/agenda-items/:id' do |id|
  content_type :json
  results = {result: false}

  @agenda_item = AgendaItem.find(id)

  # creator, mover and seconder fields are assigned 
  # an object that is found from user id
  @creator = User.find(params[:creator][:id].to_i) if params[:creator]
  @agenda_item.creator = @creator if params[:creator]

  @mover = User.find(params[:mover][:id].to_i) if params[:mover]
  @agenda_item.mover = @mover if params[:mover]

  @seconder = User.find(params[:seconder][:id].to_i) if params[:seconder]
  @agenda_item.seconder = @seconder if params[:seconder]


  @agenda_item.title = params[:title] if params[:title]
  @agenda_item.description = params[:description] if params[:description]
  @agenda_item.status = params[:status] if params[:status]
  @agenda_item.discussion = params[:discussion] if params[:discussion]
  @agenda_item.due_date = params[:due_date] if params[:due_date]

  @agenda_item.save

 if @agenda_item.save
   results[:result] = true
   @agenda_item.to_json(include: [:mover, :seconder, :creator, votes: {include: :voting_user}] )
 end
end

# delete item by id

get '/api/agenda-items/:id/delete' do
  content_type :json
  @agenda_item = AgendaItem.find(params[:id])
  @agenda_item.destroy

  # results = {result: false}
  if @agenda_item.destroy
    puts "agenda item was destroyed"
    # results[:result] = true
  end
end
