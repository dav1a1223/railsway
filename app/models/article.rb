class Article < ApplicationRecord
  belongs_to :category
  include Crawlable

end
