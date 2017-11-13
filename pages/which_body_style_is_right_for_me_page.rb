require_relative 'page'

class WhichBodyStyleIsRightForMePage < Page
  def page_url
    page.current_url
  end
end