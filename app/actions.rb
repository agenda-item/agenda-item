require_relative "utils"

helpers do

  def current_organization
    Organization.find_by(id: session[:organization_id])
  end

  def current_meeting
    @current_meeting ||= Meeting.find(session["meeting"]) if session["meeting"]
  end

  def current_user
    User.find_by(id: session[:user_id])
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
  User.all.to_json(include: :meetings)
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
  Vote.all.to_json
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

######################
# DEVELOPMENT ROUTES #
######################
# to be deleted

# get '/edit-meeting' do
#   erb :edit_meeting
# end

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
  meeting = Meeting.new
  meeting

  if meeting.save
    session["meeting"] = meeting.id
    meeting.to_json
  else
    "did not save meeting"
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
  Meeting.all.to_json
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
  current_meeting.to_json
end

# update meeting by id
post '/api/meetings/:id' do |id|
  content_type :json
  results = {result: false}
  @meeting = Meeting.find(id)

  @meeting.update(
    title:  params[:title],
    description: params[:description],
    discussion: params[:discussion],
    meeting_date: params[:meeting_date],
    location: params[:location],
    chair: params[:chair],
    adjournment_time: params[:adjournment_time],
    next_meeting_date: params[:next_meeting_date]
    )

  if @meeting.save
    results[:result] = true
    # @agenda_item.to_json(include: { :votes => {:include =>:voting_user} })
  end
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
    creator_id: 1,  #params[current_user.id]
    meeting_id: 1  #params[current_meeting.id]
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
  if params[:creator]
    @creator = User.find(params[:creator][:id].to_i)
    @agenda_item.update(
   title:  params[:title],
   description: params[:description],
   status: params[:status],
   discussion: params[:discussion],
   due_date: params[:due_date],
   creator: @creator
   )
  end
  if params[:seconder]
   @seconder = User.find(params[:seconder][:id].to_i)
   @agenda_item.update(
   title:  params[:title],
   description: params[:description],
   status: params[:status],
   discussion: params[:discussion],
   seconder: @seconder,
   due_date: params[:due_date]
   )
  end
  if params[:mover]
    @mover = User.find(params[:mover][:id].to_i)
    @agenda_item.update(
   title:  params[:title],
   description: params[:description],
   status: params[:status],
   discussion: params[:discussion],
   mover: @mover,
   due_date: params[:due_date]
   )
  end

 

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
