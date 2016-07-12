# seeding data

# Organizations
@test_org = Organization.create!(name: "Test Organization", logo: "logo.jpg", phone: "250-250-2500", email: "testorg@email.ca", address: "123 Main St", website: "www.testorg.com", user_id: 2)

# Users
@bob = User.create!(first_name: "Bob", last_name: "Smith", email: "bob_smith@email.com", type: "Board", org_title: "Chair", password: "pass123", phone: "250-555-5555", phone_permission: true, mobile: "778-555-5555", address: "4851 Skyline Dr", mail_permission: true, meeting_email_permission: true, reminders_email_permission: true)

@sylvia = User.create!(first_name: "Sylvia", last_name: "Doe", email: "minute_hater@email.com", type: "Board", org_title: "Secretary", password: "pass321", phone: "250-333-3333", phone_permission: false, mobile: "778-333-3333", address: "486 Bayhill Pl", mail_permission: true, meeting_email_permission: true, reminders_email_permission: false)

@jason = User.create!(first_name: "Jason", last_name: "Bourne", email: "who_am_i@mystery.ca", type: "attendee", org_title: "n/a", password: "ontherun99", phone: "250-867-5309", phone_permission: false, mobile: "778-867-5309", address: "1122 Kyndree Crt", mail_permission: false, meeting_email_permission: false, reminders_email_permission: false)

@milly = User.create!(first_name: "Mildred", last_name: "Pennywise", email: "scorpio94@yahoo.ca", type: "attendee", org_title: "n/a", password: "zodiac01", phone: "250-444-4444", phone_permission: false, mobile: "778-444-4444", address: "616 Cassiar Dr", mail_permission: false, meeting_email_permission: true, reminders_email_permission: false)

# MeetingPermissions
@meeting_permissions = MeetingPermission.create!(user_id: 1, meeting_id: 1, meeting_permissions: true)

# Meetings
@agm = Meeting.create!(meeting_date: DateTime.strptime("02/02/2014 15:47", "%m/%d/%Y %H:%M"), title: "Annual AGM - SPWM", status: "draft", location: "123 Main St", chair_id: 1, description: "This the the 2nd AGM for the Society for the Preservation of the Wild Mammoth", discussion: "none", adjournment_time: DateTime.strptime("02/02/2014 18:00", "%m/%d/%Y %H:%M"), next_meeting_date: DateTime.strptime("05/01/2014
18:00", "%m/%d/%Y %H:%M"))

# Meeting_Attendees
@attendee1 = MeetingAttendee.create!(meeting_id: 1, user_id: 1, attendance_type: "present")
@attendee2 = MeetingAttendee.create!(meeting_id: 1, user_id: 2, attendance_type: "present")
@attendee3 = MeetingAttendee.create!(meeting_id: 1, user_id: 3, attendance_type: "present")
@attendee4 = MeetingAttendee.create!(meeting_id: 1, user_id: 4, attendance_type: "present")

# Agenda Items
@meeting_details = AgendaItem.create!(tags: ["agm", 2014, "mammoth", "icetown"], type: "Meeting Details", title:"Details", description: "Annual AGM of The Society for the Preservation of the Wild Mammoth", discussion:"The meeting started at quarter to 4. Afterwards, Bob Smith, Previous President of the Society, welcomed
everyone. Each person introduced himself/herself. Recital of the Mammoth Pledge held by all present.", status: "active", creator_id: 1)

@business = AgendaItem.create!(tags: ["agm", 2014, "mammoth", "icetown"], type: "Business", title: "approval of agenda", description: "Agenda was circulated prior to meeting, agenda was approved", discussion: "Agenda approved", mover_id: 2, seconder_id: 3, status: "passed", creator_id: 1)

@document = AgendaItem.create!(tags: ["agm", 2014, "mammoth", "icetown"], type: "Document", title: "Minutes from previous AGM", description: "Previous minutes presented and approved.", file_path: "/minutes2013.pdf", mover_id: 2, seconder_id: 4, status: "passed", creator_id: 2)

@action_item = AgendaItem.create!(tags: ["agm", 2014, "mammoth", "icetown"], type: "Action Items", title: "Permanent Location", description: "Obtain office space for a permanent location of the society", discussion: "Bob Smith discussed the option of finding a permanent location. He proposed he would begin the search after the meeting and bring forth options for locations to the next meeting of the society", mover_id: 2, seconder_id: 4,  status: "Active", creator_id: 4)

@motion = AgendaItem.create!(tags: ["agm", 2014, "mammoth", "icetown"], type: "Motion", title: "Approval of official logo", description: "Sylvia presented a new logo (attached) for the society", discussion: "Sylvia's new logo is that of a wild Mammoth running free through fields of green with a Kingfisher bird perched upon it. Logo was voted upon and approved.", file_path: "/syvia_logo.jpg", mover_id: 1, seconder_id: 3, status: "passed", creator_id: 3)

@election1 = AgendaItem.create!(tags: ["agm", 2014, "mammoth", "icetown"], type: "Election", title: "Election of President 2014", description: "Board elections held, Bob Smith re-elected to President, Sylvia to Secretary.", discussion: "Vote held for President, Bob Smith elected.", mover_id: 2, seconder_id: 3, status: "passed", creator_id: 4)

@election2 = AgendaItem.create!(tags: ["agm", 2014, "mammoth", "icetown"], type: "Election", title: "Election of Secretary 2014", description: "Board elections held, Bob Smith re-elected to President, Sylvia to Secretary.", discussion: "Vote held for secretary all members approved, Sylvia Doe elected", mover_id: 2, seconder_id: 3, status: "passed", creator_id: 3)

# Responsible Users
@resp_user1 = ResponsibleUser.create!(agenda_item_id: 1, user_id: 1)
@resp_user1 = ResponsibleUser.create!(agenda_item_id: 2, user_id: 3)
@resp_user1 = ResponsibleUser.create!(agenda_item_id: 3, user_id: 2)
@resp_user1 = ResponsibleUser.create!(agenda_item_id: 4, user_id: 4)
@resp_user1 = ResponsibleUser.create!(agenda_item_id: 5, user_id: 2)
@resp_user1 = ResponsibleUser.create!(agenda_item_id: 6, user_id: 1)

# Votes
#previous agenda approval
# User:Bob
@prev_agenda_vote1 = Vote.create!(agenda_item_id: 2, voting_user_id: 1, vote_type: "In Favour")
# User:Sylvia
@prev_agenda_vote2 = Vote.create!(agenda_item_id: 2, voting_user_id: 2, vote_type: "In Favour")
# User:Jason
@prev_agenda_vote3 = Vote.create!(agenda_item_id: 2, voting_user_id: 3, vote_type: "In Favour")
# User:Milly
@prev_agenda_vote4 = Vote.create!(agenda_item_id: 2, voting_user_id: 4, vote_type: "In Favour")

#previous minutes approval
# User:Bob
@prev_minutes_vote1 = Vote.create!(agenda_item_id: 3, voting_user_id: 1, vote_type: "In Favour")
# User:Sylvia
@prev_minutes_vote2 = Vote.create!(agenda_item_id: 3, voting_user_id: 2, vote_type: "In Favour")
# User:Jason
@prev_minutes_vote3 = Vote.create!(agenda_item_id: 3, voting_user_id: 3, vote_type: "In Favour")
# User:Milly
@prev_minutes_vote4 = Vote.create!(agenda_item_id: 3, voting_user_id: 4, vote_type: "In Favour")

#logo approval
# User:Bob
@motion_logo_vote1 = Vote.create!(agenda_item_id: 5, voting_user_id: 1, vote_type: "In Favour")
# User:Sylvia
@motion_logo_vote2 = Vote.create!(agenda_item_id: 5, voting_user_id: 2, vote_type: "abstain")
# User:Jason
@motion_logo_vote3 = Vote.create!(agenda_item_id: 5, voting_user_id: 3, vote_type: "In Favour")
# User:Milly
@motion_logo_vote4 = Vote.create!(agenda_item_id: 5, voting_user_id: 4, vote_type: "Opposed")

#president elect
# User:Bob
@president_vote1 = Vote.create!(agenda_item_id: 6, voting_user_id: 1, vote_type: "Abstain")
# User:Sylvia
@president_vote2 = Vote.create!(agenda_item_id: 6, voting_user_id: 2, vote_type: "In Favour")
# User:Jason
@president_vote3 = Vote.create!(agenda_item_id: 6, voting_user_id: 3, vote_type: "In Favour")
# User:Milly
@president_vote4 = Vote.create!(agenda_item_id: 6, voting_user_id: 4, vote_type: "In Favour")

#secretary elect
# User:Bob
@secretary_vote1 = Vote.create!(agenda_item_id: 7, voting_user_id: 1, vote_type: "In Favour")
# User:Sylvia
@secretary_vote2 = Vote.create!(agenda_item_id: 7, voting_user_id: 2, vote_type: "Abstain")
# User:Jason
@secretary_vote3 = Vote.create!(agenda_item_id: 7, voting_user_id: 3, vote_type: "In Favour")
# User:Milly
@secretary_vote4 = Vote.create!(agenda_item_id: 7, voting_user_id: 4, vote_type: "In Favour")

# Templates
# @new_template = Template.create!(title: "AGM", description: "Template for a standard AGM")

# Options
# @basic_option = Option.create!(name: "testOption", show_option: true,  instructions: "Input basic description of option here.")

# Comments
# @new_comment = Comment.create!(content: "Jason Bourne questioned whether any of the members have actualy seen a live mammoth (in the wild or captivity) and there was a 5 minute recess while Bob Smith composed himself and Jason re-assessed his choice to be in the Society. Jason has chosen to remain.")
