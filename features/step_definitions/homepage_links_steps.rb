=begin
Given /I am on the ronde homepage/ do
	visit path_to('the Ronde homepage')
end
=end
And /I click the "(.*)" link$/ do |link|
	click_link(link)
end

Then /I should be on the ronde "(.*)" page$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end