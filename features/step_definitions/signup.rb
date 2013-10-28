Given /We are on the sign up page/ do
	visit '/users/sign_up'
end

Then /I click "(.*)"/ do |button|
	click_button button
end

Then /We should be on the tour page/ do
	current_path.should == "/static/tour"
end

Then /We should be on the users page/ do
	current_path.should == "/users"
end
