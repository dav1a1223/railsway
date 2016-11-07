require 'nokogiri'
require 'open-uri'

module Crawlable
  extend ActiveSupport::Concern

  def self.crawling
    rubyflow = Nokogiri::HTML(open('http://www.rubyflow.com/'))
    rubyflow.css('article div h1 a').map(&:content)
  end
end
