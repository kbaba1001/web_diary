xml.instruct!
xml.feed 'xmlns' => 'http://www.w3.org/2005/Atom' do
  site_url = 'http://kbaba1001.github.io/'
  xml.title 'KBABA1001\'S WEB DIARY'
  xml.subtitle 'Rails/Linux/Poem'
  xml.id URI.join(site_url, blog.options.prefix.to_s)
  xml.link 'href' => URI.join(site_url, blog.options.prefix.to_s)
  xml.link 'href' => URI.join(site_url, current_page.path), 'rel' => 'self'
  xml.updated(blog.articles.first.date.to_time.iso8601) unless blog.articles.empty?
  xml.author { xml.name 'kbaba1001' }

  blog.articles[0..5].each do |article|
    xml.entry do
      xml.title "#{article.date.strftime('%F')} #{display_title(article.title)}"
      xml.link 'rel' => 'alternate', 'href' => URI.join(site_url, article.url)
      xml.id URI.join(site_url, article.url)
      xml.published article.date.to_time.iso8601
      xml.updated File.mtime(article.source_file).iso8601
      xml.author { xml.name 'kbaba1001' }
      # xml.summary article.summary, 'type' => 'html'
      xml.content article.body, 'type' => 'html'
    end
  end
end
