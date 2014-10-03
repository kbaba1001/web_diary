task :diary do
  year, month, day, time = Time.now.strftime('%Y %m %d %H%M%S').split

  sh "mkdir -p source/blog/#{year}/#{month}/"
  sh "middleman article #{time}"
  sh "geany source/blog/#{year}/#{month}/#{day}-#{time}.html.md &"
end

task :deploy do
  sh 'middleman deploy -b'
  sh 'curl http://blogsearch.google.co.jp/ping\?url\=http://kbaba1001.github.io/feed.xml'
end
