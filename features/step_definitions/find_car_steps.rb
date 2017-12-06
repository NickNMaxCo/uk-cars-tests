Given /^search page is opened$/ do
  FindCarPage.open
end

When /^user fill in Postcode field with (\S+)$/ do |data|
  FindCarPage.given.enter_data(data)
end

When /^click the (.+) button$/ do |button_name|
  FindCarPage.given.click_button(button_name)
end

Then /^on the page with found cars an? (.+) filter is selected as (.+)$/ do |param1, param2|
  expect(CarsListPage.given.needed_button_text(param1)).to eq param2
end

Then /^an? (.+) filter is selected as (.*)$/ do |param1, param2|
  expect(CarsListPage.given.needed_button_text(param1)).to eq param2
end

Then /^filter CO2 emissions is selected as (\w+) too$/ do |param|
  expect(CarsListPage.given.selected_CO2_emissions('co2-emissions-cars')).to eq param
end

Then /^message '(.+)' is shown$/ do |message|
  expect(FindCarPage.given.invalid_postcode_text).to eq message
end

When /^choose some (.+) from Distance filter$/ do |distance|
  FindCarPage.given.select_distance(distance)
end

Then /^all cars which possible for purchase in radius of (.+) are shown$/ do |distance|
  expect(CarsListPage.given.distance_selectbox(distance)).to be_selected
end

When /^uncheck (.+) checkbox$/ do |value|
  FindCarPage.given.click_show_checkbox(value)
end

Then /^only (.+) cars are shown$/ do |value|
  expect(CarsListPage.given.check_show_checkbox(value)).to be_checked
end

Then /^the (.+) checkbox is unchecked$/ do |value|
  expect(CarsListPage.given.check_show_checkbox(value)).to_not be_checked
end

When /^choose some (.+) from Make filter$/ do |brand|
  FindCarPage.given.select_brand(brand)
end

Then /^all cars which possible for purchase from (.+) are shown$/ do |brand|
  expect(CarsListPage.given.selected_make_brand).to eq brand
end

When /^choose some (.+) from Model filter$/ do |model|
  FindCarPage.given.select_model(model)
end

Then /^all cars which possible for purchase according to selected (.+) and (.+) are shown$/ do |brand, model|
  expect(CarsListPage.given.selected_make_brand).to eq brand
  expect(CarsListPage.given.selected_model).to eq model
end

When /^choose some (.+) from Min price filter$/ do |min_price|
  FindCarPage.given.select_min_price(min_price)
end

Then /^all cars which have (.+) or more are shown$/ do |min_price|
  expect(CarsListPage.given.selected_min_price).to eq min_price
end

When /^choose some (.+) from Max price filter$/ do |max_price|
  FindCarPage.given.select_max_price(max_price)
end

Then /^all cars which have (.+) or less are shown$/ do |max_price|
  expect(CarsListPage.given.selected_max_price).to eq max_price
end

Then /^all cars which have price between (.+) and (.+) are shown$/ do |min_price, max_price|
  expect(CarsListPage.given.selected_min_price).to eq min_price
  expect(CarsListPage.given.selected_max_price).to eq max_price
end

When /^choose some (.+) from Body type filter$/ do |body_type|
  FindCarPage.given.select_body_type(body_type)
end

Then /^all (.+) cars are shown$/ do |body_type|
  expect(CarsListPage.given.selected_body_type).to eq body_type
end

When /^choose some (.+) from Year from filter$/ do |year_from|
  FindCarPage.given.select_year_from(year_from)
end

Then /^all cars with (.+) production are shown$/ do |year_from|
  expect(CarsListPage.given.selected_year_from).to eq year_from
end

When /^select (.+) from (.+) filter$/ do |filter_value_option, filter_name|
  FindCarPage.given.select_filter_option(filter_value_option, filter_name)
end

Then /^with respect to selected (.+) from (.+) filter all cars are shown$/ do |filter_option, filter_text|
  expect(CarsListPage.given.selected_field(filter_text)).to eq filter_option
end

Then /^all cars with (.+) (\S+) or less are shown$/ do |filter_text, filter_option|
  expect(CarsListPage.given.selected_field_max_engine(filter_text)).to eq filter_option
end

Then /^cars with (.+) no more than (.+) are shown$/ do |filter_text, filter_option|
  expect(CarsListPage.given.selected_mileage(filter_text)).to eq filter_option
end

Then /^cars which have (.+) no less than (.) are shown$/ do |filter_text, filter_option|
  expect(CarsListPage.given.selected_field_min_seats(filter_text)).to eq filter_option
end

Then /^cars which have (.+) no more than (.) are shown$/ do |filter_text, filter_option|
  expect(CarsListPage.given.selected_field_max_seats(filter_text)).to eq filter_option
end

Then /^cars with number of (\S+) no less than (.)$/ do |filter_text, filter_min_option|
  expect(CarsListPage.given.selected_field_min_seats(filter_text)).to eq filter_min_option
end

Then /^number of (\S+) no more than (.) are shown$/ do |filter_text, filter_max_option|
  expect(CarsListPage.given.selected_field_max_seats(filter_text)).to eq filter_max_option
end

When /^user sets some filters$/ do
  FindCarPage.given.enter_data('E203EL')
  FindCarPage.given.select_distance('Within 200 miles')
  FindCarPage.given.select_filter_option('FORD', 'make')
  FindCarPage.given.select_model('FOCUS')
  FindCarPage.given.select_min_price('0')
  FindCarPage.given.select_max_price('40000')
  FindCarPage.given.select_body_type('Hatchback')
  FindCarPage.given.select_year_from('2000')
  FindCarPage.given.select_filter_option('OVER_30', 'fuel-consumption')
  FindCarPage.given.select_filter_option('5', 'quantity-of-doors')
  FindCarPage.given.select_filter_option('TO_500', 'annual-tax-cars')
  FindCarPage.given.select_filter_option('125000', 'maximum-mileage')
  FindCarPage.given.select_filter_option('8_TO_12', 'zero-to-60')
  FindCarPage.given.select_filter_option('Blue', 'colour')
  FindCarPage.given.select_filter_option('Petrol', 'fuel-type')
  FindCarPage.given.select_filter_option('private', 'seller-type')
  FindCarPage.given.select_filter_option('2.0', 'maximum-badge-engine-size')
  FindCarPage.given.select_filter_option('TO_200', 'co2-emissions-cars')
  FindCarPage.given.select_filter_option('20U', 'insuranceGroup')
  FindCarPage.given.select_filter_option('Manual', 'transmission')
end

When /^click the (.+) link$/ do |link|
  FindCarPage.given.reset_search(link)
end

Then /^all filters are reseted$/ do
  expect(FindCarPage.given.filter_value('make')).to be_empty
  expect(FindCarPage.given.filter_value('model')).to be_empty
  expect(FindCarPage.given.filter_value('price-from')).to be_empty
  expect(FindCarPage.given.filter_value('price-to')).to be_empty
  expect(FindCarPage.given.filter_value('year-from')).to be_empty
  expect(FindCarPage.given.filter_value('colour')).to be_empty
  expect(FindCarPage.given.filter_value('fuel-consumption')).to be_empty
  expect(FindCarPage.given.filter_value('quantity-of-doors')).to be_empty
  expect(FindCarPage.given.filter_value('annual-tax-cars')).to be_empty
  expect(FindCarPage.given.filter_value('co2-emissions-cars')).to be_empty
  expect(FindCarPage.given.filter_value('zero-to-60')).to be_empty
  expect(FindCarPage.given.filter_value('fuel-type')).to be_empty
  expect(FindCarPage.given.filter_value('transmission')).to be_empty
  expect(FindCarPage.given.filter_value('seller-type')).to be_empty
  expect(FindCarPage.given.filter_value('insuranceGroup')).to be_empty
  expect(FindCarPage.given.filter_value('maximum-badge-engine-size')).to be_empty
  expect(FindCarPage.given.filter_value('minimum-seats')).to be_empty
  expect(FindCarPage.given.filter_value('maximum-seats')).to be_empty
  expect(FindCarPage.given.filter_value('maximum-mileage')).to be_empty
end

Then /^options in the (.+) filter must be no less than (.+)$/ do |max_price, value_option|
  expect(FindCarPage.given.max_price_options(max_price, value_option)).to be_truthy
end

Then /^options in the (.+) filter must be no more than (.+)$/ do |min_price, value_option|
  expect(FindCarPage.given.min_price_options(min_price, value_option)).to be_truthy
end

Then /^number of seats in the (.+) filter must be no less than (.+)$/ do |max_seats, value_option|
  expect(FindCarPage.given.max_seats_options(max_seats, value_option)).to be_truthy
end

Then /^number of seats in the (.+) filter must be no more than (.+)$/ do |min_seats, value_option|
  expect(FindCarPage.given.min_seats_options(min_seats, value_option)).to be_truthy
end

Then /^all cars with (.+) or less (.+) are shown$/ do |param1, param2|
  expect(CarsListPage.given.selected_CO2_emissions(param2)).to eq param1
end
