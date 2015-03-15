task :new do
  year, month, day, time = Time.now.strftime('%Y %m %d %H%M%S').split

  sh "mkdir -p source/blog/#{year}/#{month}/"
  sh "middleman article #{time}"
  sh "geany source/blog/#{year}/#{month}/#{day}-#{time}.html.md &"
end

task :create do
  sh 'git add -A .'
  sh "git commit -m 'diary #{Time.now}'"
  sh 'git push -u origin master'
  Rake::Task['deploy'].invoke
end

task :deploy do
  sh 'middleman deploy -b'
  sh 'curl http://blogsearch.google.co.jp/ping\?url\=http://kbaba1001.github.io/feed.xml'
end
