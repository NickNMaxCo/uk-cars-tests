require_relative 'page'

class HelpMeChoosePage < Page

  def self.url
    'help-me-choose'
  end

  def choose_body_style(body_style)
    page.click_link(body_style)
  end

  def choose_tutorial_video(text)
    page.click_link(text)
  end

end
