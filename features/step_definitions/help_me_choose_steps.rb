Given /^help me choose page is opened$/ do
  HelpMeChoosePage.open
end

When /^user choose (.+) filter$/ do |body_style|
  HelpMeChoosePage.given.choose_body_style(body_style)
end

Then /^user is redirected to a search page with selected (.+) filter$/ do |body_style|
  expect(DiscoverySearchPage.given.needed_checkbox(body_style)).to be_checked
end
