And /I am on the ronde "(.*)" page$/ do |page|
	visit "/static/#{page}"
end

And /I click the "(.*)" link$/ do |link|
	link = link.gsub(" ", "_")
	click_link("#{link}_link")
end

Then /I should be on the ronde "(.*)" page$/ do |page|
  page = page.gsub(" ", "_")
  current_path = URI.parse(current_url).path
  desired_path = "/static/#{page}"
  assert current_path == desired_path, "current_path = #{current_path}, desired_path = #{desired_path}"
end