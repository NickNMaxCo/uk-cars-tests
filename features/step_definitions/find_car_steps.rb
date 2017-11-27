Given /^page with filters for search cars is opened$/ do
  FindCarPage.open
end

When /^user fill in Postcode field with correct data$/ do
  FindCarPage.given.enter_data('E203EL')
end

And /^click the (.+) button$/ do |button_name|
  FindCarPage.given.push_button(button_name)
end

Then /^all cars possible for purchase ere shown$/ do

end

And /^an? (.+) filter is selected as (.*)$/ do |param1, param2|
  expect(FoundCarPage.given.needed_button_text(param1)).to eq param2
end

When /^user fill in Postcode field with incorrect data$/ do
  FndCarPage.given.enter_data('E203E1')
end

Then /^message '(.+)' is shown$/ do |message|
  expect(FindCarPage.given.invalid_postcode_text).to eq message
end

And /^choose some (.+) from Distance filter$/ do |distance|
  FindCarPage.given.select_distance(distance)
end

Then /^all cars which possible for purchase in radius of (.+) are shown$/ do |distance|
  expect(FoundCarPage.given.distance_selectbox(distance)).to be_selected
end

And /^uncheck (.+) checkbox$/ do |value|
  FindCarPage.given.click_show_checkbox(value)
end

Then /^only (.+) cars are shown$/ do |value|
  expect(FoundCarPage.given.check_show_checkbox(value)).to be_checked
end

And /^the (.+) checkbox is unchecked$/ do |value|
  expect(FoundCarPage.given.check_show_checkbox(value)).to_not be_checked
end

And /^choose some (.+) from Make filter$/ do |brand|
  FindCarPage.given.select_brand(brand)
end

Then /^all cars which possible for purchase from (.+) are shown$/ do |brand|
  expect(FoundCarPage.given.selected_make_brand).to eq brand
end

And /^choose some (.+) from Model filter$/ do |model|
  FindCarPage.given.select_model(model)
end

Then /^all cars which possible for purchase according to selected (.+) and (.+) are shown$/ do |brand, model|
  expect(FoundCarPage.given.selected_make_brand).to eq brand
  expect(FoundCarPage.given.selected_model).to eq model
end

And /^choose some (.+) from Min price filter$/ do |min_price|
  FindCarPage.given.select_min_price(min_price)
end

Then /^all cars which have (.+) or more are shown$/ do |min_price|
  expect(FoundCarPage.given.selected_min_price).to eq min_price
end

And /^choose some (.+) from Max price filter$/ do |max_price|
  FindCarPage.given.select_max_price(max_price)
end

Then /^all cars which have (.+) or less are shown$/ do |max_price|
  expect(FoundCarPage.given.selected_max_price).to eq max_price
end

Then /^all cars which have price between (.+) and (.+) are shown$/ do |min_price, max_price|
  expect(FoundCarPage.given.selected_min_price).to eq min_price
  expect(FoundCarPage.given.selected_max_price).to eq max_price
end

And /^choose some (.+) from Body type filter$/ do |body_type|
  FindCarPage.given.select_body_type(body_type)
end

Then /^all (.+) cars are shown$/ do |body_type|
  expect(FoundCarPage.given.selected_body_type).to eq body_type
end

And /^choose some (.+) from Year from filter$/ do |year_from|
  FindCarPage.given.select_year_from(year_from)
end

Then /^all cars with (.+) production are shown$/ do |year_from|
  expect(FoundCarPage.given.selected_year_from).to eq year_from
end

And /^select (.+) from (.+) filter$/ do |filter_value_option, filter_name|
  FindCarPage.given.select_filter_option(filter_value_option, filter_name)
end

Then /^with respect to selected (.+) from (.+) filter all cars are shown$/ do |filter_option, filter_text|
  expect(FoundCarPage.given.selected_field(filter_text)).to eq filter_option
end

Then /^all cars with (.+) (\S+) or less are shown$/ do |filter_text, filter_option|
  expect(FoundCarPage.given.selected_field_max_engine(filter_text)).to eq filter_option
end

Then /^cars with (.+) no more than (.+) are shown$/ do |filter_text, filter_option|
  expect(FoundCarPage.given.selected_mileage(filter_text)).to eq filter_option
end

Then /^cars which have (.+) no less than (.) are shown$/ do |filter_text, filter_option|
  expect(FoundCarPage.given.selected_field_min_seats(filter_text)).to eq filter_option
end

Then /^cars which have (.+) no more than (.) are shown$/ do |filter_text, filter_option|
  expect(FoundCarPage.given.selected_field_max_seats(filter_text)).to eq filter_option
end

Then /^cars with number of (\S+) no less than (.)$/ do |filter_text, filter_min_option|
  expect(FoundCarPage.given.selected_field_min_seats(filter_text)).to eq filter_min_option
end

And /^number of (\S+) no more than (.) are shown$/ do |filter_text, filter_max_option|
  expect(FoundCarPage.given.selected_field_max_seats(filter_text)).to eq filter_max_option
end

When /^user clck the (.+) link$/ do |link|
  FindCarPage.given.reset_search(link)
end

Then /^filter (.+) is reseted$/ do |filter_name|
  expect(FindCarPage.given.filter_value(filter_name)).to eq ""
end

Then /^options in the (.+) filter must be no less than (.+)$/ do |max_price, value_option|
  expect(FindCarPage.given.max_price_options(max_price, value_option)).to eq true
end

Then /^options in the (.+) filter must be no more than (.+)$/ do |min_price, value_option|
  expect(FindCarPage.given.min_price_options(min_price, value_option)).to eq true
end

Then /^number of seats in the (.+) filter must be no less than (.+)$/ do |max_seats, value_option|
  expect(FindCarPage.given.max_seats_options(max_seats, value_option)).to eq true
end

Then /^number of seats in the (.+) filter must be no more than (.+)$/ do |min_seats, value_option|
  expect(FindCarPage.given.min_seats_options(min_seats, value_option)).to eq true
end
