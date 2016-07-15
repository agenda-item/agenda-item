# seeding data
require "pry"
# Organizations
@test_org = Organization.create!(name: "Test Organization", logo: "logo.jpg", phone: "250-250-2500", email: "testorg@email.ca", address: "123 Main St", website: "www.testorg.com")
# Users
@bob = User.create!(organization_id: @test_org.id, first_name: "Bob", last_name: "Smith", email: "bob_smith@email.com", type: "Board", org_title: "Chair", password: "password1" , phone: "250-555-5555", phone_permission: true, mobile: "778-555-5555", address: "4851 Skyline Dr", mail_permission: true, meeting_email_permission: true, reminders_email_permission: true)

@sylvia = User.create!(organization_id: @test_org.id,first_name: "Sylvia", last_name: "Doe", email: "minute_hater@email.com", type: "Board", org_title: "Secretary", password: "password2", phone: "250-333-3333", phone_permission: false, mobile: "778-333-3333", address: "486 Bayhill Pl", mail_permission: true, meeting_email_permission: true, reminders_email_permission: false)

@jason = User.create!(organization_id: @test_org.id,first_name: "Jason", last_name: "Bourne", email: "who_am_i@mystery.ca", type: "attendee", org_title: "n/a", password: "password3", phone: "250-867-5309", phone_permission: false, mobile: "778-867-5309", address: "1122 Kyndree Crt", mail_permission: false, meeting_email_permission: false, reminders_email_permission: false)

@milly = User.create!(organization_id: @test_org.id,first_name: "Mildred", last_name: "Pennywise", email: "scorpio94@yahoo.ca", type: "attendee", org_title: "n/a", password: "password4", phone: "250-444-4444", phone_permission: false, mobile: "778-444-4444", address: "616 Cassiar Dr", mail_permission: false, meeting_email_permission: true, reminders_email_permission: false)

#getting org to recognize its owner
@test_org.user_id = @sylvia.id

# Meetings
@agm = Meeting.create!(meeting_date: DateTime.strptime("02/02/2014 15:47", "%m/%d/%Y %H:%M"), title: "Annual AGM - SPWM", status: "draft", organization_id: @test_org.id, location: "123 Main St", chair_id: @bob.id, description: "This the the 2nd AGM for the Society for the Preservation of the Wild Mammoth", discussion: "The meeting started at quarter to 4. Afterwards, Bob Smith, Previous President of the Society, welcomed everyone. Each person introduced himself/herself. Recital of the Mammoth Pledge held by all present.", adjournment_time: DateTime.strptime("02/02/2014 18:00", "%m/%d/%Y %H:%M"), next_meeting_date: DateTime.strptime("05/01/2014 18:00", "%m/%d/%Y %H:%M"))

# MeetingPermissions
@meeting_permissions = MeetingPermission.create!(user_id: @bob.id, meeting_id: @agm.id, meeting_permissions: "true")

# Meeting_Attendees
@attendee1 = MeetingAttendee.create!(meeting_id: @agm.id, user_id: @bob.id, attendance_type: "present")
@attendee2 = MeetingAttendee.create!(meeting_id: @agm.id, user_id: @sylvia.id, attendance_type: "present")
@attendee3 = MeetingAttendee.create!(meeting_id: @agm.id, user_id: @jason.id, attendance_type: "present")
@attendee4 = MeetingAttendee.create!(meeting_id: @agm.id, user_id: @milly.id, attendance_type: "present")

# Agenda Items

@business = AgendaItem.create!(tags: ["agm", 2014, "mammoth", "icetown"], type: "Business", title: "approval of agenda", description: "Agenda was circulated prior to meeting, agenda was approved", discussion: "Agenda approved", mover_id: @sylvia.id, seconder_id: @jason.id, status: "passed", meeting_id: @agm.id, creator_id: @bob.id)

@document = AgendaItem.create!(tags: ["agm", 2014, "mammoth", "icetown"], type: "Document", title: "Minutes from previous AGM", description: "Previous minutes presented and approved.", discussion: "The previous AGM minutes were presented and all present approved", file_path: "/minutes2013.pdf", mover_id: @jason.id, seconder_id: @milly.id, status: "passed", meeting_id: @agm.id, creator_id: @sylvia.id)

@action_item = AgendaItem.create!(tags: ["agm", 2014, "mammoth", "icetown"], type: "Action Items", title: "Permanent Location", description: "Obtain office space for a permanent location of the society", discussion: "Bob Smith discussed the option of finding a permanent location. He proposed he would begin the search after the meeting and bring forth options for locations to the next meeting of the society", mover_id: @sylvia.id, seconder_id: @milly.id,  status: "Active", meeting_id: @agm.id, creator_id: @bob.id)

@motion = AgendaItem.create!(tags: ["agm", 2014, "mammoth", "icetown"], type: "Motion", title: "Approval of official logo", description: "Sylvia presented a new logo (attached) for the society", discussion: "Sylvia's new logo is that of a wild Mammoth running free through fields of green with a Kingfisher bird perched upon it. Logo was voted upon and approved.", file_path: "/syvia_logo.jpg", mover_id: @bob.id, seconder_id: @milly.id, status: "passed", meeting_id: @agm.id, creator_id: @sylvia.id)

@election1 = AgendaItem.create!(tags: ["agm", 2014, "mammoth", "icetown"], type: "Election", title: "Election of President 2014", description: "Board election for President.", discussion: "Vote held for President, all members approved, Bob Smith re-elected.", mover_id: @sylvia.id, seconder_id: @jason.id, status: "passed", meeting_id: @agm.id, creator_id: @milly.id)

@election2 = AgendaItem.create!(tags: ["agm", 2014, "mammoth", "icetown"], type: "Election", title: "Election of Secretary 2014", description: "Board election for Secretary.", discussion: "Vote held for secretary, all members approved, Sylvia Doe re-elected", mover_id: @milly.id, seconder_id: @jason.id, status: "passed", meeting_id: @agm.id, creator_id: @bob.id)

# Responsible Users

@resp_user1 = ResponsibleUser.create!(agenda_item_id: @business.id, user_id: @jason.id)
@resp_user2 = ResponsibleUser.create!(agenda_item_id: @document.id, user_id: @sylvia.id)
@resp_user3 = ResponsibleUser.create!(agenda_item_id: @action_item.id, user_id: @milly.id)
@resp_user4 = ResponsibleUser.create!(agenda_item_id: @motion.id, user_id: @sylvia.id)
@resp_user5 = ResponsibleUser.create!(agenda_item_id: @election1.id, user_id: @jason.id)
@resp_user6 = ResponsibleUser.create!(agenda_item_id: @election2.id, user_id: @jason.id)

# Votes

#previous agenda approval
# User:Bob
@prev_agenda_vote1 = Vote.create!(agenda_item_id: @business.id, voting_user_id: @bob.id, vote_type: "In Favour")
# User:Sylvia
@prev_agenda_vote2 = Vote.create!(agenda_item_id: @business.id, voting_user_id: @sylvia.id, vote_type: "In Favour")
# User:Jason
@prev_agenda_vote3 = Vote.create!(agenda_item_id: @business.id, voting_user_id: @jason.id, vote_type: "In Favour")
# User:Milly
@prev_agenda_vote4 = Vote.create!(agenda_item_id: @business.id, voting_user_id: @milly.id, vote_type: "In Favour")

#previous minutes approval
# User:Bob
@prev_minutes_vote1 = Vote.create!(agenda_item_id: @document.id, voting_user_id: @bob.id, vote_type: "In Favour")
# User:Sylvia
@prev_minutes_vote2 = Vote.create!(agenda_item_id: @document.id, voting_user_id: @sylvia.id, vote_type: "In Favour")
# User:Jason
@prev_minutes_vote3 = Vote.create!(agenda_item_id: @document.id, voting_user_id: @jason.id, vote_type: "In Favour")
# User:Milly
@prev_minutes_vote4 = Vote.create!(agenda_item_id: @document.id, voting_user_id: @milly.id, vote_type: "In Favour")

#logo approval
# User:Bob
@motion_logo_vote1 = Vote.create!(agenda_item_id: @motion.id, voting_user_id: @bob.id, vote_type: "In Favour")
# User:Sylvia
@motion_logo_vote2 = Vote.create!(agenda_item_id: @motion.id, voting_user_id: @sylvia.id, vote_type: "abstain")
# User:Jason
@motion_logo_vote3 = Vote.create!(agenda_item_id: @motion.id, voting_user_id: @jason.id, vote_type: "In Favour")
# User:Milly
@motion_logo_vote4 = Vote.create!(agenda_item_id: @motion.id, voting_user_id: @milly.id, vote_type: "Opposed")

#president elect
# User:Bob
@president_vote1 = Vote.create!(agenda_item_id: @election1.id, voting_user_id: @bob.id, vote_type: "Abstain")
# User:Sylvia
@president_vote2 = Vote.create!(agenda_item_id: @election1.id, voting_user_id: @sylvia.id, vote_type: "In Favour")
# User:Jason
@president_vote3 = Vote.create!(agenda_item_id: @election1.id, voting_user_id: @jason.id, vote_type: "In Favour")
# User:Milly
@president_vote4 = Vote.create!(agenda_item_id: @election1.id, voting_user_id: @milly.id, vote_type: "In Favour")

#secretary elect
# User:Bob
@secretary_vote1 = Vote.create!(agenda_item_id: @election2.id, voting_user_id: @bob.id, vote_type: "In Favour")
# User:Sylvia
@secretary_vote2 = Vote.create!(agenda_item_id: @election2.id, voting_user_id: @sylvia.id, vote_type: "Abstain")
# User:Jason
@secretary_vote3 = Vote.create!(agenda_item_id: @election2.id, voting_user_id: @jason.id, vote_type: "In Favour")
# User:Milly
@secretary_vote4 = Vote.create!(agenda_item_id: @election2.id, voting_user_id: @milly.id, vote_type: "In Favour")

binding.pry
# Templates
# @new_template = Template.create!(title: "AGM", description: "Template for a standard AGM")

# Options
# @basic_option = Option.create!(name: "testOption", show_option: true,  instructions: "Input basic description of option here.")

# Comments
# @new_comment = Comment.create!(content: "Jason Bourne questioned whether any of the members have actualy seen a live mammoth (in the wild or captivity) and there was a 5 minute recess while Bob Smith composed himself and Jason re-assessed his choice to be in the Society. Jason has chosen to remain.")
