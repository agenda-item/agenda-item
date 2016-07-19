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


get '/edit-meeting' do
  erb :edit_meeting
end


get '/select' do
  erb :select_status
end


get '/motion' do
  erb :motion
end

get '/election' do
  erb :election
end

get '/business' do
  erb :business
end

get '/document' do
  erb :document
end

get '/meeting-details' do
  erb :meeting_details
end

get '/richtext' do 
  erb :rich_text_discussion
end

#################
# FILE UPLOADER #
#################

get "/files-upload" do
  @files = Dir["./public/files/*"]
  erb :file_upload
end

post '/agenda-items/:id/save_file' do
  @filename = params[:file][:filename]
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

# update meeting by id
post '/api/meetings/:id' do |id|
  content_type :json
  results = {result: false}
  @meeting = Meeting.find(id)
  puts @meeting

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

  @agenda_item.update(
    title:  params[:title],
    description: params[:description],
    status: params[:status],
    discussion: params[:discussion],
    mover: params[:mover],
    seconder: params[:seconder],
    due_date: params[:due_date]
    )

  if @agenda_item.save
    results[:result] = true
    # @agenda_item.to_json(include: { :votes => {:include =>:voting_user} })
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

post '/api/agenda-items/:id/responsible-users' do |id|
  content_type :json
  @responsible_users = ResponsibleUser.where(agenda_item_id: id)

  @agenda_item = AgendaItem.find(params[:id])

  responsible_user_ids = params[:responsible_users].map do |user|
    user[:id]
  end
  # active record is smart enough to figure this out and not create orphan records
  @agenda_item.user_ids = responsible_user_ids

end

post '/api/agenda-items/:id/voters' do |id|
  content_type :json
  @voters = Voter.where(agenda_item_id: id)

  @voters.each do |voter|
    @voter = Voter.find(voter.id)
    @voter.update(
      vote_type: params[:vote_type]
    )
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
