###################
#  Organizations  #
###################

# Society for the Preservation of the Wild Mammoth (SPWM)
@spwm = Organization.create!(name: "SPWM", logo: "logo.jpg", phone: "250-250-2500", email: "spwm@email.ca", address: "123 Main St", website: "www.spwm.com")

# Cat Herders of Canada (CHOC)
@choc = Organization.create!(name: "Cat Herders of Canada", logo: "logo.jpg", phone: "778-555-0000", email: "choc@email.ca", address: "515 Meow Ave", website: "www.catherders.ca")

####################
#  Users for SPWM  #
####################

@bob = User.create!(organization_id: @spwm.id, first_name: "Bob", last_name: "Smith", email: "bob_smith@email.com", type: "Board", org_title: "Chair", password: "password1" , phone: "250-555-5555", phone_permission: true, mobile: "778-555-5555", address: "4851 Skyline Dr", mail_permission: true, meeting_email_permission: true, reminders_email_permission: true)

@sylvia = User.create!(organization_id: @spwm.id,first_name: "Sylvia", last_name: "Doe", email: "minute_hater@email.com", type: "Board", org_title: "Secretary", password: "password2", phone: "250-333-3333", phone_permission: false, mobile: "778-333-3333", address: "486 Bayhill Pl", mail_permission: true, meeting_email_permission: true, reminders_email_permission: false)

@jason = User.create!(organization_id: @spwm.id,first_name: "Jason", last_name: "Bourne", email: "who_am_i@mystery.ca", type: "attendee", org_title: "n/a", password: "password3", phone: "250-867-5309", phone_permission: false, mobile: "778-867-5309", address: "1122 Kyndree Crt", mail_permission: false, meeting_email_permission: false, reminders_email_permission: false)

@milly = User.create!(organization_id: @spwm.id,first_name: "Mildred", last_name: "Pennywise", email: "scorpio94@yahoo.ca", type: "attendee", org_title: "n/a", password: "password4", phone: "250-444-4444", phone_permission: false, mobile: "778-444-4444", address: "616 Cassiar Dr", mail_permission: false, meeting_email_permission: true, reminders_email_permission: false)

###########################
#  Users for Cat Herders  #
###########################

@calico = User.create!(organization_id: @choc.id, first_name: "Cali", last_name: "Cocat", email: "calico@email.com", type: "Board", org_title: "Chair", password: "meowmeow1" , phone: "250-111-1111", phone_permission: true, mobile: "778-111-1111", address: "592 Hairball Ave", mail_permission: true, meeting_email_permission: true, reminders_email_permission: true)

@tabby = User.create!(organization_id: @choc.id,first_name: "Tabitha", last_name: "Catz", email: "tabby_catz@email.com", type: "Board", org_title: "Secretary", password: "meowmeow2", phone: "250-222-2222", phone_permission: false, mobile: "778-222-2222", address: "901 Catnip Dr", mail_permission: true, meeting_email_permission: true, reminders_email_permission: false)

@siamese = User.create!(organization_id: @choc.id,first_name: "Sia", last_name: "Mees", email: "high_cost@cats.ca", type: "attendee", org_title: "n/a", password: "meowmeow3", phone: "250-818-1818", phone_permission: false, mobile: "778-818-1818", address: "1001 Fleabath Rd", mail_permission: false, meeting_email_permission: false, reminders_email_permission: false)

@catman = User.create!(organization_id: @choc.id,first_name: "Bruce", last_name: "Clayne", email: "catman@yahoo.ca", type: "attendee", org_title: "n/a", password: "meowmeow4", phone: "250-688-8866", phone_permission: false, mobile: "778-553-3355", address: "1 Catcave Cres", mail_permission: false, meeting_email_permission: true, reminders_email_permission: false)

########################################
#  getting org to recognize its owner  #
########################################

@spwm.user_id = @sylvia.id
@choc.user_id = @tabby.id

#####################
#  Meetings (SPWM)  #
#####################

# First Meeting
@agm1 = Meeting.create!(meeting_date: DateTime.strptime("01/12/2013 12:35", "%m/%d/%Y %H:%M"), title: "Annual AGM - SPWM", status: "draft", organization_id: @spwm.id, location: "123 Main St", chair_id: @bob.id, description: "This the the 1st AGM for the Society for the Preservation of the Wild Mammoth", discussion: "The meeting started at 12:35. Afterwards, Bob Smith, Acting President of the Society, welcomed everyone. Each person introduced himself/herself. Recital of the Mammoth Pledge held by all present.", adjournment_time: DateTime.strptime("01/12/2013 13:20", "%m/%d/%Y %H:%M"), next_meeting_date: DateTime.strptime("05/01/2014 18:00", "%m/%d/%Y %H:%M"))

# Second Meeting
@agm = Meeting.create!(meeting_date: DateTime.strptime("02/02/2014 15:47", "%m/%d/%Y %H:%M"), title: "Annual AGM - SPWM", status: "draft", organization_id: @spwm.id, location: "123 Main St", chair_id: @bob.id, description: "This the the 2nd AGM for the Society for the Preservation of the Wild Mammoth", discussion: "The meeting started at quarter to 4. Afterwards, Bob Smith, Previous President of the Society, welcomed everyone. Each person introduced himself/herself. Recital of the Mammoth Pledge held by all present.", adjournment_time: DateTime.strptime("02/02/2014 18:00", "%m/%d/%Y %H:%M"), next_meeting_date: DateTime.strptime("05/01/2014 18:00", "%m/%d/%Y %H:%M"))

############################
#  Meetings (Cat Herders)  #
############################

# First Meeting
@agmew1 = Meeting.create!(meeting_date: DateTime.strptime("09/16/2014 14:30", "%m/%d/%Y %H:%M"), title: "Annual AGM - SPWM", status: "draft", organization_id: @choc.id, location: "592 Hairball Ave", chair_id: @calico.id, description: "This the the 1st AGM of Cat Herders of Canada", discussion: "The meeting started at 2:30. Cal Ico, Founder and Acting President, welcomed everyone and thanked them for attending. Each person introduced himself/herself and their cats.", adjournment_time: DateTime.strptime("09/16/2014 16:05", "%m/%d/%Y %H:%M"), next_meeting_date: DateTime.strptime("05/01/2014 18:00", "%m/%d/%Y %H:%M"))

# Second Meeting
@agmew2 = Meeting.create!(meeting_date: DateTime.strptime("09/15/2015 13:45", "%m/%d/%Y %H:%M"), title: "Annual AGM - SPWM", status: "draft", organization_id: @choc.id, location: "1 Catcave Cres", chair_id: @catman.id, description: "This the the 2nd AGM of Cat Herders of Canada", discussion: "The meeting started at quarter to 2. Cal Ico, Previous President, greeted everyone and thanked Bruce Clayne for allowing the use of his...home due to Cal's unfortunate eviction by landlords who don't appreciate cats . Each person re- introduced himself/herself as well as the one cat they chose to bring", adjournment_time: DateTime.strptime("09/15/2015 16:40", "%m/%d/%Y %H:%M"), next_meeting_date: DateTime.strptime("05/01/2014 18:00", "%m/%d/%Y %H:%M"))

########################
#  MeetingPermissions  #
########################

@meeting_permissions1 = MeetingPermission.create!(user_id: @bob.id, meeting_id: @agm1.id, meeting_permissions: "true")
@meeting_permissions = MeetingPermission.create!(user_id: @bob.id, meeting_id: @agm.id, meeting_permissions: "true")
@mew_permission1 = MeetingPermission.create!(user_id: @calico.id, meeting_id: @agmew1.id, meeting_permissions: "true")
@mew_permission2 = MeetingPermission.create!(user_id: @calico.id, meeting_id: @agmew2.id, meeting_permissions: "true")

#######################
#  Meeting_Attendees  #
#######################

# agm1
@attendee1 = MeetingAttendee.create!(meeting_id: @agm1.id, user_id: @bob.id, attendance_type: "present")
@attendee2 = MeetingAttendee.create!(meeting_id: @agm1.id, user_id: @sylvia.id, attendance_type: "present")
@attendee3 = MeetingAttendee.create!(meeting_id: @agm1.id, user_id: @jason.id, attendance_type: "present")
@attendee4 = MeetingAttendee.create!(meeting_id: @agm1.id, user_id: @milly.id, attendance_type: "present")

# @agm
@attendee5 = MeetingAttendee.create!(meeting_id: @agm.id, user_id: @bob.id, attendance_type: "present")
@attendee6 = MeetingAttendee.create!(meeting_id: @agm.id, user_id: @sylvia.id, attendance_type: "present")
@attendee7 = MeetingAttendee.create!(meeting_id: @agm.id, user_id: @jason.id, attendance_type: "present")
@attendee8 = MeetingAttendee.create!(meeting_id: @agm.id, user_id: @milly.id, attendance_type: "present")

# agmew1
@herder1 = MeetingAttendee.create!(meeting_id: @agmew1.id, user_id: @calico.id, attendance_type: "present")
@herder2 = MeetingAttendee.create!(meeting_id: @agmew1.id, user_id: @tabby.id, attendance_type: "present")
@herder3 = MeetingAttendee.create!(meeting_id: @agmew1.id, user_id: @siamese.id, attendance_type: "present")
@herder4 = MeetingAttendee.create!(meeting_id: @agmew1.id, user_id: @catman.id, attendance_type: "present")

# agmew2
@herder5 = MeetingAttendee.create!(meeting_id: @agmew2.id, user_id: @calico.id, attendance_type: "present")
@herder6 = MeetingAttendee.create!(meeting_id: @agmew2.id, user_id: @tabby.id, attendance_type: "present")
@herder7 = MeetingAttendee.create!(meeting_id: @agmew2.id, user_id: @siamese.id, attendance_type: "present")
@herder8 = MeetingAttendee.create!(meeting_id: @agmew2.id, user_id: @catman.id, attendance_type: "present")

#########################
#  Agenda Items (SPWM)  #
#########################

# first meeting
@business1 = AgendaItem.create!(tags: ["@agm1", 2014, "mammoth", "icetown"], type: "Business", title: "approval of agenda", description: "Agenda was circulated prior to meeting, agenda was approved", discussion: "Agenda approved", mover_id: @bob.id, seconder_id: @sylvia.id, status: "passed", meeting_id: @agm1.id, position: 1, creator_id: @bob.id)

@document1 = AgendaItem.create!(tags: ["@agm1", 2014, "mammoth", "icetown"], type: "Document", title: "Official Pledge", description: "We decided to officially create a Mammoth pledge which should be recited before every meeting", discussion: "The pledge was presented and all present approved", file_path: "/pledge.pdf", mover_id: @jason.id, seconder_id: @milly.id, status: "passed", meeting_id: @agm1.id, position: 2, creator_id: @sylvia.id)

@action_item1 = AgendaItem.create!(tags: ["@agm1", 2014, "mammoth", "icetown"], type: "Action Item", title: "Location", description: "Basement Location", discussion: "We decided that the basement of the community hall was a perfect location", mover_id: @sylvia.id, seconder_id: @milly.id,  status: "Active", meeting_id: @agm1.id, position: 3, creator_id: @bob.id)

@motion1 = AgendaItem.create!(tags: ["@agm1", 2014, "mammoth", "icetown"], type: "Motion", title: "Keep Jason", description: "Decision to have Jason remain within Society", discussion: "Jason was overheard questioning whether mammoths are still alive. He agreed to never say such a thing again and provided a signed agreement", file_path: "/bad_jason.pdf", mover_id: @bob.id, seconder_id: @milly.id, status: "passed", meeting_id: @agm1.id, position: 4, creator_id: @sylvia.id)

@election1_1 = AgendaItem.create!(tags: ["@agm1", 2014, "mammoth", "icetown"], type: "Election", title: "Election of President 2014", description: "Board election for President.", discussion: "Vote held for President, all members approved, Bob Smith elected.", mover_id: @sylvia.id, seconder_id: @jason.id, status: "passed", meeting_id: @agm1.id, position: 5, creator_id: @milly.id)

@election2_1 = AgendaItem.create!(tags: ["@agm1", 2014, "mammoth", "icetown"], type: "Election", title: "Election of Secretary 2014", description: "Board election for Secretary.", discussion: "Vote held for secretary, all members approved, Sylvia Doe elected", mover_id: @milly.id, seconder_id: @jason.id, status: "passed", meeting_id: @agm1.id, position: 6, creator_id: @bob.id)

# second meeting
@business = AgendaItem.create!(tags: ["@agm", 2014, "mammoth", "icetown"], type: "Business", title: "approval of agenda", description: "Agenda was circulated prior to meeting, agenda was approved", discussion: "Agenda approved", mover_id: @sylvia.id, seconder_id: @jason.id, status: "passed", meeting_id: @agm.id, position: 1, creator_id: @bob.id)

@document = AgendaItem.create!(tags: ["@agm", 2014, "mammoth", "icetown"], type: "Document", title: "Minutes from previous AGM", description: "Previous minutes presented and approved.", discussion: "The previous AGM minutes were presented and all present approved", file_path: "/minutes2013.pdf", mover_id: @jason.id, seconder_id: @milly.id, status: "passed", meeting_id: @agm.id, position: 2, creator_id: @sylvia.id)

@action_item = AgendaItem.create!(tags: ["@agm", 2014, "mammoth", "icetown"], type: "Action Item", title: "Permanent Location", description: "Obtain office space for a permanent location of the society", discussion: "Bob Smith discussed the option of finding a permanent location. He proposed he would begin the search after the meeting and bring forth options for locations to the next meeting of the society", mover_id: @sylvia.id, seconder_id: @milly.id,  status: "Active", meeting_id: @agm.id, position: 3, creator_id: @bob.id)

@motion = AgendaItem.create!(tags: ["@agm", 2014, "mammoth", "icetown"], type: "Motion", title: "Approval of official logo", description: "Sylvia presented a new logo (attached) for the society", discussion: "Sylvia's new logo is that of a wild Mammoth running free through fields of green with a Kingfisher bird perched upon it. Logo was voted upon and approved.", file_path: "/syvia_logo.jpg", mover_id: @bob.id, seconder_id: @milly.id, status: "passed", meeting_id: @agm.id, position: 4, creator_id: @sylvia.id)

@election1 = AgendaItem.create!(tags: ["@agm", 2014, "mammoth", "icetown"], type: "Election", title: "Election of President 2014", description: "Board election for President.", discussion: "Vote held for President, all members approved, Bob Smith re-elected.", mover_id: @sylvia.id, seconder_id: @jason.id, status: "passed", meeting_id: @agm.id, position: 5, creator_id: @milly.id)

@election2 = AgendaItem.create!(tags: ["@agm", 2014, "mammoth", "icetown"], type: "Election", title: "Election of Secretary 2014", description: "Board election for Secretary.", discussion: "Vote held for secretary, all members approved, Sylvia Doe re-elected", mover_id: @milly.id, seconder_id: @jason.id, status: "passed", meeting_id: @agm.id, position: 6, creator_id: @bob.id)

#########################
#  Agenda Items (CHOC)  #
#########################

# first meeting
@catnews = AgendaItem.create!(tags: ["agmew1", 2014, "cat", "herder"], type: "Business", title: "approval of group name", description: "The decision to name ourselves Cat Herders of Canada was proposed and approved.", discussion: "Name Approved", mover_id: @calico.id, seconder_id: @tabby.id, status: "passed", meeting_id: @agmew1.id, position: 1, creator_id: @calico.id)

@papers = AgendaItem.create!(tags: ["agmew1", 2014, "cat", "herder"], type: "Document", title: "Proof of Cat Ownership", description: "Everyone presented scanned files proving ownership of cats. Cal combined all four files and submitted the 53 pages as one document", discussion: "Everyone proved they own at least 7 cats. Cal owns 12, Tabitha owns 7, Sia owns 11, Bruce owns 23.", file_path: "/cats.pdf", mover_id: @catman.id, seconder_id: @siamese.id, status: "passed", meeting_id: @agmew1.id, position: 2, creator_id: @catman.id)

@litterbox = AgendaItem.create!(tags: ["agmew1", 2014, "cat", "herder"], type: "Action Item", title: "Selection of disposal site", description: "Obtain permit for disposal of copious amouts of kitty litter", discussion: "Cal and Tabitha informed the others that they have found a farmer willing to take the litter but would charge $2 per pound dropped off. The current funds available ($230) will cover the first couple months.", mover_id: @calico.id, seconder_id: @tabby.id,  status: "Active", meeting_id: @agmew1.id, position: 3, creator_id: @siamese.id)

@herders = AgendaItem.create!(tags: ["agmew1", 2014, "cat", "herder"], type: "Motion", title: "Approval of official logo", description: "Cali presented a logo (attached) for the group", discussion: "Cal's logo is that of a cat, sleeping while another cat chases a catnip mouse in the background. Logo was voted upon and approved.", file_path: "/cats_rule.jpg", mover_id: @siamese.id, seconder_id: @tabby.id, status: "passed", meeting_id: @agmew1.id, position: 4, creator_id: @calico.id)

@elect1 = AgendaItem.create!(tags: ["agmew1", 2014, "cat", "herder"], type: "Election", title: "Election of President 2014", description: "Board election for President.", discussion: "Vote held for President, all members approved, Cal chosen as President.", mover_id: @catman.id, seconder_id: @siamese.id, status: "passed", meeting_id: @agmew1.id, position: 5, creator_id: @tabby.id)

@elect2 = AgendaItem.create!(tags: ["agmew1", 2014, "cat", "herder"], type: "Election", title: "Election of Secretary 2014", description: "Board election for Secretary.", discussion: "Vote held for secretary, all members approved, Tabitha elected", mover_id: @calico.id, seconder_id: @catman.id, status: "passed", meeting_id: @agmew1.id, position: 6, creator_id: @calico.id)

# 2nd meeting
@catnews2 = AgendaItem.create!(tags: ["agmew1", 2014, "cat", "herder"], type: "Business", title: "approval of group motto", description: "Decision made regarding a new motto.", discussion: "Motto approved - Claw's for a Cause", mover_id: @calico.id, seconder_id: @tabby.id, status: "passed", meeting_id: @agmew2.id, position: 1, creator_id: @calico.id)

@papers2 = AgendaItem.create!(tags: ["agmew1", 2014, "cat", "herder"], type: "Document", title: "Proof of Cat Ownership", description: "Everyone presented new files proving ownership of previous cats and any new ones since the last meeting. Cal combined all four files and submitted the 71 pages as one document", discussion: "Everyone proved they own at least 7 cats. Cal owns 19, Tabitha owns 11, Sia owns 10, Bruce owns 21.", file_path: "/cats_new.pdf", mover_id: @catman.id, seconder_id: @siamese.id, status: "passed", meeting_id: @agmew2.id, position: 2, creator_id: @catman.id)

@litterbox2 = AgendaItem.create!(tags: ["agmew1", 2014, "cat", "herder"], type: "Action Item", title: "Selection of new disposal site", description: "Obtain permit for disposal of copious amouts of kitty litter", discussion: "Cal and Tabitha informed the others that the farmer will no longer be able to handle the quantity of litter we've been bringing him. The decision has been made to find another location or perhaps multiple locations.", mover_id: @calico.id, seconder_id: @tabby.id,  status: "Active", meeting_id: @agmew2.id, position: 3, creator_id: @catman.id)

@herders2 = AgendaItem.create!(tags: ["agmew1", 2014, "cat", "herder"], type: "Motion", title: "Approval of official logo", description: "Bruce proposed that we make his home our permanent location", discussion: "All agreed that Bruce's home would be a great fit as it allows for more cats. We did have to sign paperwork for his landlord, attached", file_path: "/cat_bylaw.jpg", mover_id: @calico.id, seconder_id: @tabby.id, status: "passed", meeting_id: @agmew2.id, position: 4, creator_id: @siamese.id)

@elect1_2 = AgendaItem.create!(tags: ["agmew1", 2014, "cat", "herder"], type: "Election", title: "Election of President 2014", description: "Board election for President.", discussion: "Vote held for President, all members approved, Cal re-elected as President.", mover_id: @catman.id, seconder_id: @siamese.id, status: "passed", meeting_id: @agmew2.id, position: 5, creator_id: @tabby.id)

@elect2_2 = AgendaItem.create!(tags: ["agmew1", 2014, "cat", "herder"], type: "Election", title: "Election of Secretary 2014", description: "Board election for Secretary.", discussion: "Vote held for secretary, all members approved, Tabitha re-elected", mover_id: @calico.id, seconder_id: @catman.id, status: "passed", meeting_id: @agmew2.id, position: 6, creator_id: @calico.id)

##############################
#  Responsible Users (SPWM)  #
##############################

# agm1
@resp_user1a = ResponsibleUser.create!(agenda_item_id: @business1.id, user_id: @bob.id)
@resp_user2b = ResponsibleUser.create!(agenda_item_id: @document1.id, user_id: @sylvia.id)
@resp_user3c = ResponsibleUser.create!(agenda_item_id: @action_item1.id, user_id: @bob.id)
@resp_user4d = ResponsibleUser.create!(agenda_item_id: @motion1.id, user_id: @sylvia.id)
@resp_user5e = ResponsibleUser.create!(agenda_item_id: @election1_1.id, user_id: @milly.id)
@resp_user6f = ResponsibleUser.create!(agenda_item_id: @election2_1.id, user_id: @bob.id)

# agm
@resp_user1 = ResponsibleUser.create!(agenda_item_id: @business.id, user_id: @bob.id)
@resp_user2 = ResponsibleUser.create!(agenda_item_id: @document.id, user_id: @sylvia.id)
@resp_user3 = ResponsibleUser.create!(agenda_item_id: @action_item.id, user_id: @bob.id)
@resp_user4 = ResponsibleUser.create!(agenda_item_id: @motion.id, user_id: @sylvia.id)
@resp_user5 = ResponsibleUser.create!(agenda_item_id: @election1.id, user_id: @milly.id)
@resp_user6 = ResponsibleUser.create!(agenda_item_id: @election2.id, user_id: @bob.id)

##############################
#  Responsible Users (CHOC)  #
##############################

# agmew1
@resp_herder1a = ResponsibleUser.create!(agenda_item_id: @catnews.id, user_id: @calico.id)
@resp_herder2b = ResponsibleUser.create!(agenda_item_id: @papers.id, user_id: @catman.id)
@resp_herder3c = ResponsibleUser.create!(agenda_item_id: @litterbox.id, user_id: @siamese.id)
@resp_herder4d = ResponsibleUser.create!(agenda_item_id: @herders.id, user_id: @catman.id)
@resp_herder5e = ResponsibleUser.create!(agenda_item_id: @elect1.id, user_id: @tabby.id)
@resp_herder6f = ResponsibleUser.create!(agenda_item_id: @elect2.id, user_id: @calico.id)

# agmew2
@resp_herder1 = ResponsibleUser.create!(agenda_item_id: @catnews2.id, user_id: @calico.id)
@resp_herder2 = ResponsibleUser.create!(agenda_item_id: @papers2.id, user_id: @catman.id)
@resp_herder3 = ResponsibleUser.create!(agenda_item_id: @litterbox2.id, user_id: @catman.id)
@resp_herder4 = ResponsibleUser.create!(agenda_item_id: @herders2.id, user_id: @siamese.id)
@resp_herder5 = ResponsibleUser.create!(agenda_item_id: @elect1_2.id, user_id: @tabby.id)
@resp_herder6 = ResponsibleUser.create!(agenda_item_id: @elect2_2.id, user_id: @calico.id)

#######################
#  Votes SPWM - agm1  #
#######################

# First Agenda Approval

# User:Bob
@first_agenda_vote1 = Vote.create!(agenda_item_id: @business1.id, voting_user_id: @bob.id, vote_type: "In Favour")
# User:Sylvia
@first_agenda_vote2 = Vote.create!(agenda_item_id: @business1.id, voting_user_id: @sylvia.id, vote_type: "In Favour")
# User:Jason
@first_agenda_vote3 = Vote.create!(agenda_item_id: @business1.id, voting_user_id: @jason.id, vote_type: "In Favour")
# User:Milly
@first_agenda_vote4 = Vote.create!(agenda_item_id: @business1.id, voting_user_id: @milly.id, vote_type: "In Favour")

# Pledge Approval

# User:Bob
@pledge_vote1 = Vote.create!(agenda_item_id: @document1.id, voting_user_id: @bob.id, vote_type: "In Favour")
# User:Sylvia
@pledge_vote2 = Vote.create!(agenda_item_id: @document1.id, voting_user_id: @sylvia.id, vote_type: "In Favour")
# User:Jason
@pledge_vote3 = Vote.create!(agenda_item_id: @document1.id, voting_user_id: @jason.id, vote_type: "In Favour")
# User:Milly
@pledge_vote4 = Vote.create!(agenda_item_id: @document1.id, voting_user_id: @milly.id, vote_type: "In Favour")

# Basement Location Approval

# User:Bob
@location_vote1 = Vote.create!(agenda_item_id: @action_item1.id, voting_user_id: @bob.id, vote_type: "In Favour")
# User:Sylvia
@location_vote2 = Vote.create!(agenda_item_id: @action_item1.id, voting_user_id: @sylvia.id, vote_type: "In Favour")
# User:Jason
@location_vote3 = Vote.create!(agenda_item_id: @action_item1.id, voting_user_id: @jason.id, vote_type: "In Favour")
# User:Milly
@location_vote4 = Vote.create!(agenda_item_id: @action_item1.id, voting_user_id: @milly.id, vote_type: "In Favour")

# Jason Allowed to Remain in Society

# User:Bob
@keep_jason_vote1 = Vote.create!(agenda_item_id: @motion1.id, voting_user_id: @bob.id, vote_type: "In Favour")
# User:Sylvia
@keep_jason_vote2 = Vote.create!(agenda_item_id: @motion1.id, voting_user_id: @sylvia.id, vote_type: "Opposed")
# User:Jason
@keep_jason_vote3 = Vote.create!(agenda_item_id: @motion1.id, voting_user_id: @jason.id, vote_type: "Abstain")
# User:Milly
@keep_jason_vote4 = Vote.create!(agenda_item_id: @motion1.id, voting_user_id: @milly.id, vote_type: "In Favour")

# First President Election

# User:Bob
@first_president_vote1 = Vote.create!(agenda_item_id: @election1_1.id, voting_user_id: @bob.id, vote_type: "In Favour")
# User:Sylvia
@first_president_vote2 = Vote.create!(agenda_item_id: @election1_1.id, voting_user_id: @sylvia.id, vote_type: "In Favour")
# User:Jason
@first_president_vote3 = Vote.create!(agenda_item_id: @election1_1.id, voting_user_id: @jason.id, vote_type: "In Favour")
# User:Milly
@first_president_vote4 = Vote.create!(agenda_item_id: @election1_1.id, voting_user_id: @milly.id, vote_type: "In Favour")

# First Secretary Election

# User:Bob
@first_secretary_vote1 = Vote.create!(agenda_item_id: @election2_1.id, voting_user_id: @bob.id, vote_type: "In Favour")
# User:Sylvia
@first_secretary_vote2 = Vote.create!(agenda_item_id: @election2_1.id, voting_user_id: @sylvia.id, vote_type: "In Favour")
# User:Jason
@first_secretary_vote3 = Vote.create!(agenda_item_id: @election2_1.id, voting_user_id: @jason.id, vote_type: "In Favour")
# User:Milly
@first_secretary_vote4 = Vote.create!(agenda_item_id: @election2_1.id, voting_user_id: @milly.id, vote_type: "In Favour")

#######################
#  Votes SPWM - agm   #
#######################

#Previous Agenda Approval

# User:Bob
@prev_agenda_vote1 = Vote.create!(agenda_item_id: @business.id, voting_user_id: @bob.id, vote_type: "In Favour")
# User:Sylvia
@prev_agenda_vote2 = Vote.create!(agenda_item_id: @business.id, voting_user_id: @sylvia.id, vote_type: "In Favour")
# User:Jason
@prev_agenda_vote3 = Vote.create!(agenda_item_id: @business.id, voting_user_id: @jason.id, vote_type: "In Favour")
# User:Milly
@prev_agenda_vote4 = Vote.create!(agenda_item_id: @business.id, voting_user_id: @milly.id, vote_type: "In Favour")

#Previous Meeting Approval

# User:Bob
@prev_minutes_vote1 = Vote.create!(agenda_item_id: @document.id, voting_user_id: @bob.id, vote_type: "In Favour")
# User:Sylvia
@prev_minutes_vote2 = Vote.create!(agenda_item_id: @document.id, voting_user_id: @sylvia.id, vote_type: "In Favour")
# User:Jason
@prev_minutes_vote3 = Vote.create!(agenda_item_id: @document.id, voting_user_id: @jason.id, vote_type: "In Favour")
# User:Milly
@prev_minutes_vote4 = Vote.create!(agenda_item_id: @document.id, voting_user_id: @milly.id, vote_type: "In Favour")

# Search for New Location

# User:Bob
@new_location_vote1 = Vote.create!(agenda_item_id: @action_item.id, voting_user_id: @bob.id, vote_type: "In Favour")
# User:Sylvia
@new_location_vote2 = Vote.create!(agenda_item_id: @action_item.id, voting_user_id: @sylvia.id, vote_type: "In Favour")
# User:Jason
@new_location_vote3 = Vote.create!(agenda_item_id: @action_item.id, voting_user_id: @jason.id, vote_type: "Opposed")
# User:Milly
@new_location_vote4 = Vote.create!(agenda_item_id: @action_item.id, voting_user_id: @milly.id, vote_type: "In Favour")

#Logo Approval

# User:Bob
@motion_logo_vote1 = Vote.create!(agenda_item_id: @motion.id, voting_user_id: @bob.id, vote_type: "In Favour")
# User:Sylvia
@motion_logo_vote2 = Vote.create!(agenda_item_id: @motion.id, voting_user_id: @sylvia.id, vote_type: "Abstain")
# User:Jason
@motion_logo_vote3 = Vote.create!(agenda_item_id: @motion.id, voting_user_id: @jason.id, vote_type: "In Favour")
# User:Milly
@motion_logo_vote4 = Vote.create!(agenda_item_id: @motion.id, voting_user_id: @milly.id, vote_type: "Opposed")

#President Re-election

# User:Bob
@president_vote1 = Vote.create!(agenda_item_id: @election1.id, voting_user_id: @bob.id, vote_type: "Abstain")
# User:Sylvia
@president_vote2 = Vote.create!(agenda_item_id: @election1.id, voting_user_id: @sylvia.id, vote_type: "In Favour")
# User:Jason
@president_vote3 = Vote.create!(agenda_item_id: @election1.id, voting_user_id: @jason.id, vote_type: "In Favour")
# User:Milly
@president_vote4 = Vote.create!(agenda_item_id: @election1.id, voting_user_id: @milly.id, vote_type: "In Favour")

#Secretary Re-election

# User:Bob
@secretary_vote1 = Vote.create!(agenda_item_id: @election2.id, voting_user_id: @bob.id, vote_type: "In Favour")
# User:Sylvia
@secretary_vote2 = Vote.create!(agenda_item_id: @election2.id, voting_user_id: @sylvia.id, vote_type: "Abstain")
# User:Jason
@secretary_vote3 = Vote.create!(agenda_item_id: @election2.id, voting_user_id: @jason.id, vote_type: "In Favour")
# User:Milly
@secretary_vote4 = Vote.create!(agenda_item_id: @election2.id, voting_user_id: @milly.id, vote_type: "In Favour")

#########################
#  Votes CHOC - agmew1  #
#########################

# Official Name

# User:Cali
@name_vote1 = Vote.create!(agenda_item_id: @catnews.id, voting_user_id: @calico.id, vote_type: "In Favour")
# User:Tabitha
@name_vote2 = Vote.create!(agenda_item_id: @catnews.id, voting_user_id: @tabby.id, vote_type: "In Favour")
# User:Sia
@name_vote3 = Vote.create!(agenda_item_id: @catnews.id, voting_user_id: @siamese.id, vote_type: "In Favour")
# User:Bruce
@name_vote4 = Vote.create!(agenda_item_id: @catnews.id, voting_user_id: @catman.id, vote_type: "Opposed")

# First Proof of Cat Ownership

# User:Cali
@proof_vote1 = Vote.create!(agenda_item_id: @papers.id, voting_user_id: @calico.id, vote_type: "In Favour")
# User:Tabitha
@proof_vote2 = Vote.create!(agenda_item_id: @papers.id, voting_user_id: @tabby.id, vote_type: "In Favour")
# User:Sia
@proof_vote3 = Vote.create!(agenda_item_id: @papers.id, voting_user_id: @siamese.id, vote_type: "In Favour")
# User:Bruce
@proof_vote4 = Vote.create!(agenda_item_id: @papers.id, voting_user_id: @catman.id, vote_type: "In Favour")

# Litter Disposal

# User:Cali
@litter_vote1 = Vote.create!(agenda_item_id: @litterbox.id, voting_user_id: @calico.id, vote_type: "In Favour")
# User:Tabitha
@litter_vote2 = Vote.create!(agenda_item_id: @litterbox.id, voting_user_id: @tabby.id, vote_type: "In Favour")
# User:Sia
@litter_vote3 = Vote.create!(agenda_item_id: @litterbox.id, voting_user_id: @siamese.id, vote_type: "In Favour")
# User:Bruce
@litter_vote4 = Vote.create!(agenda_item_id: @litterbox.id, voting_user_id: @catman.id, vote_type: "Opposed")

# Approval of Cat Logo

# User:Cali
@cat_logo_vote1 = Vote.create!(agenda_item_id: @herders.id, voting_user_id: @calico.id, vote_type: "Abstain")
# User:Tabitha
@cat_logo_vote2 = Vote.create!(agenda_item_id: @herders.id, voting_user_id: @tabby.id, vote_type: "Opposed")
# User:Sia
@cat_logo_vote3 = Vote.create!(agenda_item_id: @herders.id, voting_user_id: @siamese.id, vote_type: "In Favour")
# User:Bruce
@cat_logo_vote4 = Vote.create!(agenda_item_id: @herders.id, voting_user_id: @catman.id, vote_type: "In Favour")

# First President Election

# User:Cali
@cat_president_vote1 = Vote.create!(agenda_item_id: @elect1.id, voting_user_id: @calico.id, vote_type: "Abstain")
# User:Tabitha
@cat_president_vote2 = Vote.create!(agenda_item_id: @elect1.id, voting_user_id: @tabby.id, vote_type: "In Favour")
# User:Sia
@cat_president_vote3 = Vote.create!(agenda_item_id: @elect1.id, voting_user_id: @siamese.id, vote_type: "In Favour")
# User:Bruce
@cat_president_vote4 = Vote.create!(agenda_item_id: @elect1.id, voting_user_id: @catman.id, vote_type: "In Favour")

# First Secretary Election

# User:Cali
@cat_secretary_vote1 = Vote.create!(agenda_item_id: @elect2.id, voting_user_id: @calico.id, vote_type: "In Favour")
# User:Tabitha
@cat_secretary_vote2 = Vote.create!(agenda_item_id: @elect2.id, voting_user_id: @tabby.id, vote_type: "Abstain")
# User:Sia
@cat_secretary_vote3 = Vote.create!(agenda_item_id: @elect2.id, voting_user_id: @siamese.id, vote_type: "In Favour")
# User:Bruce
@cat_secretary_vote4 = Vote.create!(agenda_item_id: @elect2.id, voting_user_id: @catman.id, vote_type: "In Favour")

#########################
#  Votes CHOC - agmew2  #
#########################

#New Motto

# User:Cali
@motto_vote1 = Vote.create!(agenda_item_id: @catnews2.id, voting_user_id: @calico.id, vote_type: "In Favour")
# User:Tabitha
@motto_vote2 = Vote.create!(agenda_item_id: @catnews2.id, voting_user_id: @tabby.id, vote_type: "In Favour")
# User:Sia
@motto_vote3 = Vote.create!(agenda_item_id: @catnews2.id, voting_user_id: @siamese.id, vote_type: "In Favour")
# User:Bruce
@motto_vote4 = Vote.create!(agenda_item_id: @catnews2.id, voting_user_id: @catman.id, vote_type: "In Favour")

#New Proof of Cat Ownership

# User:Cali
@proof2_vote1 = Vote.create!(agenda_item_id: @papers2.id, voting_user_id: @calico.id, vote_type: "In Favour")
# User:Tabitha
@proof2_vote2 = Vote.create!(agenda_item_id: @papers2.id, voting_user_id: @tabby.id, vote_type: "In Favour")
# User:Sia
@proof2_vote3 = Vote.create!(agenda_item_id: @papers2.id, voting_user_id: @siamese.id, vote_type: "In Favour")
# User:Bruce
@proof2_vote4 = Vote.create!(agenda_item_id: @papers2.id, voting_user_id: @catman.id, vote_type: "In Favour")

# Search for New Litter Location

# User:Cali
@new_litter_vote1 = Vote.create!(agenda_item_id: @litterbox2.id, voting_user_id: @calico.id, vote_type: "In Favour")
# User:Tabitha
@new_litter_vote2 = Vote.create!(agenda_item_id: @litterbox2.id, voting_user_id: @tabby.id, vote_type: "In Favour")
# User:Sia
@new_litter_vote3 = Vote.create!(agenda_item_id: @litterbox2.id, voting_user_id: @siamese.id, vote_type: "Opposed")
# User:Bruce
@new_litter_vote4 = Vote.create!(agenda_item_id: @litterbox2.id, voting_user_id: @catman.id, vote_type: "In Favour")

#New Cathome (Meeting place)

# User:Cali
@catcave_vote1 = Vote.create!(agenda_item_id: @herders2.id, voting_user_id: @calico.id, vote_type: "In Favour")
# User:Tabitha
@catcave_vote2 = Vote.create!(agenda_item_id: @herders2.id, voting_user_id: @tabby.id, vote_type: "In Favour")
# User:Sia
@catcave_vote3 = Vote.create!(agenda_item_id: @herders2.id, voting_user_id: @siamese.id, vote_type: "In Favour")
# User:Bruce
@catcave_vote4 = Vote.create!(agenda_item_id: @herders2.id, voting_user_id: @catman.id, vote_type: "Abstain")

#President Re-election

# User:Cali
@new_president_vote1 = Vote.create!(agenda_item_id: @elect1_2.id, voting_user_id: @calico.id, vote_type: "Abstain")
# User:Tabitha
@new_president_vote2 = Vote.create!(agenda_item_id: @elect1_2.id, voting_user_id: @tabby.id, vote_type: "In Favour")
# User:Sia
@new_president_vote3 = Vote.create!(agenda_item_id: @elect1_2.id, voting_user_id: @siamese.id, vote_type: "In Favour")
# User:Bruce
@new_president_vote4 = Vote.create!(agenda_item_id: @elect1_2.id, voting_user_id: @catman.id, vote_type: "In Favour")

#Secretary Re-election

# User:Cali
@new_secretary_vote1 = Vote.create!(agenda_item_id: @elect2_2.id, voting_user_id: @calico.id, vote_type: "In Favour")
# User:Tabitha
@new_secretary_vote2 = Vote.create!(agenda_item_id: @elect2_2.id, voting_user_id: @tabby.id, vote_type: "Abstain")
# User:Sia
@new_secretary_vote3 = Vote.create!(agenda_item_id: @elect2_2.id, voting_user_id: @siamese.id, vote_type: "In Favour")
# User:Bruce
@new_secretary_vote4 = Vote.create!(agenda_item_id: @elect2_2.id, voting_user_id: @catman.id, vote_type: "In Favour")
