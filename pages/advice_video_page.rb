require_relative 'page'

class AdviceVideoPage < Page

  def marker
    page.find(:xpath, "//h1[@class = 'display-1']", visible: false).text
  end

end
