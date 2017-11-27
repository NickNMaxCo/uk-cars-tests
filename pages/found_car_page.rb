require_relative 'page'

class FoundCarPage < Page

  def needed_button_text(text)
    page.find(:xpath, "//span[text()= '#{text}']/following-sibling::span[1]", visible: false).text
  end

  def distance_selectbox(value)
    page.find(:xpath, "//option[text()='#{value}']", visible: false)
  end

  def check_show_checkbox(value)
    page.find(:xpath, "//input[@value = '#{value}']", visible: false)
  end

  def selected_make_brand
    page.find(:xpath, "//span[text()= 'Make']/following-sibling::span[1]", visible: false).text
  end

  def selected_model
    page.find(:xpath, "//span[text()= 'Model']/following-sibling::span[1]", visible: false).text
  end

  def selected_min_price
    page.find(:xpath, "//span[text()= 'Price']/following-sibling::span[1]/descendant::span[2]/descendant::span[1]", visible: false).text
  end

  def selected_max_price
    page.find(:xpath, "//span[text()= 'Price']/following-sibling::span[1]/descendant::span[2]/descendant::span[2]", visible: false).text
  end

  def selected_body_type
    page.find(:xpath, "//span[text()= 'Body type']/following-sibling::span[1]", visible: false).text
  end

  def selected_year_from
    page.find(:xpath, "//span[text()= 'Year']/following-sibling::span[1]/descendant::span[2]/descendant::span[1]").text
  end

  def selected_field(filter_text)
    page.find(:xpath, "//span[text()= '#{filter_text}']/following-sibling::span[1]").text
  end

  def selected_field_max_engine(filter_text)
    page.find(:xpath, "//span[text()= '#{filter_text}']/following-sibling::span[1]/descendant::span[2]/descendant::span[2]").text
  end

  def selected_mileage(filter_text)
    page.find(:xpath, "//span[text()= '#{filter_text}']/following-sibling::span[1]/descendant::span[2]/descendant::span[2]").text
  end

  def selected_field_min_seats(filter_text)
    page.find(:xpath, "//span[text()= '#{filter_text}']/following-sibling::span[1]/descendant::span[2]/descendant::span[1]").text
  end

  def selected_field_max_seats(filter_text)
    page.find(:xpath, "//span[text()= '#{filter_text}']/following-sibling::span[1]/descendant::span[2]/descendant::span[2]").text
  end

end
