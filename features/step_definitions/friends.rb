Given /"(.*)" and "(.*)" are friends/ do |user1, user2|
	u1 = User.find_by_first_name(user1)
	u2 = User.find_by_first_name(user2)
	Friendship.request(u1, u2)
	Friendship.accept(u2, u1)
end

And /I am logged in as "(.*)" with password "(.*)"/ do |email, password|
	visit "/users/sign_in"
	fill_in("user_email", :with => email)
	fill_in("user_password", :with => password)
	click_on "Sign in"
end

And /I am on the dashboard for user with id (.)/ do |id|
	visit "/dashboard"
end

# When /I follow "My Friends"/ do
# 	click_on "friends"
# end

Given /"(.*)" has sent a friend request to "(.*)"/ do |user1, user2|
	u1 = User.find_by_first_name(user1)
	u2 = User.find_by_first_name(user2)
	Friendship.request(u1, u2)
end

When /I click on "(.*)"/ do |field|
	click_on "#{field}"
end

Then /Within "(.*)" I should not see "(.*)"/ do |section, name|
	loc1 = page.text.index("#{section}")
	loc2 = page.text.index("#{name}")
	loc1.should be > loc2
end

Then /In "Friend Requests" I should not see "(.*)"/ do |name|
	loc_f_r = page.text.index("Friend Requests")
	loc_f = page.text.index("Friends")
	loc2 = page.text.index("#{name}")
	loc2.should be > loc_f
	loc_f.should be > loc_f_r
end