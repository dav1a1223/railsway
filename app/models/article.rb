class Article < ApplicationRecord
  belongs_to :category
  include Crawlable

  searchable do
    text :title, :description
  end
end
