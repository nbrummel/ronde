Given /I am on the ronde dashboard/ do
	visit '/dashboard'
end
Given /I have created an event called "(.*)" as user "(.*)" to invite friend "(.*)"/ do |event_name, user_name, friend_name|
	@user = User.where('first_name = ?', user_name.gsub!(/\A"|"\Z/, '')).first
	@friend = User.find_by_id(2)
	visit "/events/new"
	fill_in "event[name]", :with => event_name
	fill_in('event[description]', :with => 'event description')
	fill_in('event[location]', :with => 'event location')
	fill_in('event[event_type]', :with => 'other')
 	fill_in('event[start]', :with => '12:00 PM')
 	fill_in('event[end]', :with => '2:00 PM')
	click_button "Create"
	@event = Event.where('name LIKE ?', event_name).first
	visit "/events/#{@event.id}/invite"
	check("invited_user_#{@friend.id}")
	click_button "Invite"
end

Given /I have signed up as (.*)/ do |user|
	visit '/users/sign_up'
	fill_in('user_first_name', :with => "#{user}First")
	fill_in('user_last_name', :with => "#{user}Last")
	fill_in('user_email', :with => "#{user}First@example.com")
	fill_in('user_phone_number', :with => '5105105101')
	fill_in('user_password', :with => 'RondePassword')
	fill_in('user_password_confirmation', :with => 'RondePassword')
	click_button 'Sign up'
end

Given /I am logged in as user (.*)/ do |user|
	visit '/users/sign_in'
	fill_in('user_email', :with => "#{user}@example.com")
	fill_in('user_password', :with => 'RondePassword')
	click_button 'Sign in'
end

Given /I have signed out/ do
	visit '/users/sign_out'
end

Given /I am on the page for the event called "(.*)"/ do |event|
	@event = Event.where('name LIKE ?', event).first
	visit "/events/#{@event.id}"
end

Given /I have created an event called "(.*)" as "(.*)"/ do |event_name, user_name|
	@user = User.where('first_name = ?', user_name.gsub!(/\A"|"\Z/, '')).first
	visit "/events/new"
	fill_in "event[name]", :with => event_name
	fill_in('event[description]', :with => 'event description')
	fill_in('event[location]', :with => 'event location')
	fill_in('event[event_type]', :with => 'other')
 	fill_in('event[start]', :with => '12:00 PM')
 	fill_in('event[end]', :with => '2:00 PM')
	click_button "Create"
end

And /I fill in the start time/ do
	select('45', :from => 'event_start_5i')
end

And /I leave the "(.*)" field blank/ do |field|
	# do nothing
end

And /I select the event type/ do
	select('Other', :from => 'event_event_type')
end

Then /I should be on the new events page/ do
	current_path.should == '/events/new'
end

Then /I should be on the all events page/ do
	current_path.should == '/events/show/all'
end

Then /I should be on the page for that event/ do
	current_path.should == '/events/1'
end

And /I choose (.*)/ do |user|
	userfirst = user
	userlast = user.gsub('First', 'Last')
	check('friends[1]')
end


