class Article < ApplicationRecord
  belongs_to :category
  include Crawlable

  searchable do
    text :title, :description
    string :sort_title do
      title.downcase.gsub(/^(an?|the)/, '')
    end
  end
end
