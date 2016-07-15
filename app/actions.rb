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

