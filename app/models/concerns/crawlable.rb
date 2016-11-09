module Crawlable
  extend ActiveSupport::Concern

  class_methods do
    def rubyflow
      rubyflow = Nokogiri::HTML(open('http://www.rubyflow.com/'))
      rubyflow.css('article div[@class="body"]').each do |info|
        if info.content.present?
          article = Article.new
          article.title = info.children[1].children[0].children.text
          break if repeated? article.title
          article.from = 'Rubyflow'
          article.description = info.children[3].children.text.strip
          article.url = 'http://www.rubyflow.com' + info.children[1].children[0].attributes['href']
          article.author = info.children[5].children[0].children[2].text.strip
          article.save!
        end
      end
      puts "#{Time.now} + Rubyflow"
    end

    def sitepoint_ruby
      sitepoint_ruby = Nokogiri::HTML(open('https://www.sitepoint.com/ruby/'))
      sitepoint_ruby.css('a[@class="l-p-rel l-d-f l-jc-cen l-jc-fs--2col l-w-100 l-mb4 l-mb5--2col HomePanel"]').each do |info|
        article = Article.new
        article.title = info.children[1].children[1].children[0].text
        break if repeated? article.title
        article.from = 'SitePoint Ruby'
        article.description = info.children[1].children[2].children[0]&.text
        article.url = info.attributes['href']
        article.author = info.children[1].children[0].children[1].children[0].text.split(',')[0]
        article.save!
      end
      puts "#{Time.now} + SitePoint"
    end

    def repeated?(article_title)
      Article.exists?(title: article_title)
    end
  end
end
