task :diary do
  year, month, day, time = Time.now.strftime('%Y %m %d %H%M%S').split

  sh "mkdir -p source/blog/#{year}/#{month}/"
  sh "middleman article #{time}"
  sh "geany source/blog/#{year}/#{month}/#{day}-#{time}.html.md &"
end
