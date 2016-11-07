
# Rubyflow
rubyflow = Nokogiri::HTML(open('http://www.rubyflow.com/'))
rubyflow.css('article div[@class="body"]').each do |info|
  if info.content.present?
    article = Article.new
    article.title = info.children[1].children[0].children.text
    article.description = info.children[3].children.text.strip
    article.from = "Rubyflow"
    article.url = "http://www.rubyflow.com" + info.children[1].children[0].attributes["href"]
    article.author = info.children[5].children[0].children[2].text.strip
    article.save!
  end
end
puts Time.now
