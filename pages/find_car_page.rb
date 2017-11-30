require_relative 'page'

class FindCarPage < Page

  def self.url
    'used-cars'
  end

  def enter_data(data)
    page.fill_in('Postcode', with: data)
  end

  def push_button(data)
    page.click_button(data)
  end

  def invalid_postcode_text
    page.find("p.checkbox__invalid-postcode").text
  end

  def select_distance(distance)
    page.select(distance, from: "radius")
  end

  def click_show_checkbox(value)
    page.uncheck(value)
  end

  def select_brand(brand)
    page.find_field("make").find("option[value='#{brand}']").click
  end

  def select_model(model)
    page.find_field("model").find("option[value='#{model}']").click
  end

  def select_min_price(min_price)
    page.find_field("price-from").find("option[value='#{min_price}']").click
  end

  def select_max_price(max_price)
    page.find_field("price-to").find("option[value='#{max_price}']").click
  end

  def select_body_type(body_type)
    page.find(".body-type-container.#{body_type} .tick-image").double_click
  end

  def select_year_from(year_from)
    page.find_field("year-from").find("option[value='#{year_from}']").click
  end

  def select_filter_option(filter_value_option, filter_name)
    page.find_field("#{filter_name}").find("option[value='#{filter_value_option}']").click
  end

  def reset_search(link)
    page.find(:xpath, "//span[text()='#{link}']").click
  end

  def filter_value(filter_name)
    page.find_field("#{filter_name}").value
  end

  def max_price_options(max_price, value_option)
    page.find_field("#{max_price}").all('option').drop(1).all?{|option| option.value.to_i >= value_option.to_i}
  end

  def min_price_options(min_price, value_option)
    page.find_field("#{min_price}").all('option').drop(1).all?{|option| option.value.to_i <= value_option.to_i}
  end

  def max_seats_options(max_seats, value_option)
    page.find_field("#{max_seats}").all('option').drop(1).all?{|option| option.value.to_i >= value_option.to_i}
  end

  def min_seats_options(min_seats, value_option)
    page.find_field("#{min_seats}").all('option').drop(1).all?{|option| option.value.to_i <= value_option.to_i}
  end

end
