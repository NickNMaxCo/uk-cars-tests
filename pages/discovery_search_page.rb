require_relative 'page'

class DiscoverySearchPage < Page

  def needed_checkbox(body_style)
    page.find("input[value='#{body_style}']", visible: false)
  end

  def needed_radio_text(text)
    page.find(:xpath, "//div[text()= '#{text}']/following-sibling::div[1]", visible: false).text
  end

end