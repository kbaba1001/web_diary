task :diary do
  year, month, time = Time.now.strftime('%Y %m %H%M%S').split

  sh "mkdir -p source/blog/#{year}/#{month}/"
  sh "middleman article #{time}"
end
