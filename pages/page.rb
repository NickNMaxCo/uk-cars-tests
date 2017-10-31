require 'singleton'

class Page

  include Singleton

  attr_accessor :page

  def self.open
    given.page = Capybara.current_session
    given.page.visit("#{url}")
  end

  def self.given
    instance
  end
end
