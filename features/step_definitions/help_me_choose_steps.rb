Given /^help me choose page is opened$/ do
  HelpMeChoosePage.open
end

When /^user choose (.+) filter$/ do |style|
  HelpMeChoosePage.given.choose_body_style(style)
end

Then /^user is redirected to a search page with selected (.+) filter$/ do |body_type|
  expect(DiscoverySearchPage.given.needed_checkbox(body_type)).to be_checked
end

And /^an (.+) filter is seted as (.*)$/ do |param1, param2|
  expect(DiscoverySearchPage.given.needed_radio_text(param1)).to eq param2
end

When /^user clicks the link (.+)$/ do |text|
  HelpMeChoosePage.given.choose_tutorial_video(text)
end

Then /^user is redirected to page with tutorial video$/ do
  expect(WhichBodyStyleIsRightForMePage.given.page_url).to eq 'https://www.autotrader.co.uk/content/advice/which-body-style-is-right-for-me'
end
