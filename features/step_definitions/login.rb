Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    User.create!(user)
  end
end

And /I try to visit the friends page of another user/ do
	visit "/user/1/friends"
end
