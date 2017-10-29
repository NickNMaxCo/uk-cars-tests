require 'singleton'

class Page

  include Singleton

  @@base_uri = 'https://www.autotrader.co.uk'

  attr_accessor :page

  def self.open
    given.page = Capybara::Session.new(:selenium)
    given.page.visit("#{@@base_uri}/#{url}")
  end

  def self.given
    instance
  end
end
