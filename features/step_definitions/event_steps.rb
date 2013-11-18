Given /I am on the ronde dashboard/ do
	visit '/dashboard'
end

Given /I am logged in as RondeFirst/ do
	visit '/users/sign_up'
	fill_in('user_email', :with => 'ronde@gmail.com')
	fill_in('user_first_name', :with => 'RondeFirst')
	fill_in('user_last_name', :with => 'RondeLast')
	fill_in('user_email', :with => 'ronde@gmail.com')
	fill_in('user_phone_number', :with => '5105105101')
	fill_in('user_password', :with => 'RondePassword')
	fill_in('user_password_confirmation', :with => 'RondePassword')
	click_button 'Sign up'
end

Given /I am logged in as SondeFirst/ do
	visit '/users/sign_up'
	fill_in('user_email', :with => 'sonde@gmail.com')
	fill_in('user_first_name', :with => 'SondeFirst')
	fill_in('user_last_name', :with => 'SondeLast')
	fill_in('user_email', :with => 'sonde@gmail.com')
	fill_in('user_phone_number', :with => '5105105102')
	fill_in('user_password', :with => 'SondePassword')
	fill_in('user_password_confirmation', :with => 'SondePassword')
	click_button 'Sign up'
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
	current_path.should == '/user/1/event/new'
end

Then /I should be on the all events page/ do
	current_path.should == '/events/show/all'
end

Then /I should be on the page for that event/ do
	current_path.should == '/events/1'
end


