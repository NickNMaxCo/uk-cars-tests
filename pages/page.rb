require 'singleton'

class Page

  include Singleton

  attr_accessor :page

  def initialize
    self.page = Capybara.current_session
  end

  def self.open
    given.page.visit("#{url}")
  end

  def self.given
    instance
  end

end
