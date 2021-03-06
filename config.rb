Slim::Engine.disable_option_validator!
# Indent html for pretty debugging and do not sort attributes
Slim::Engine.set_options pretty: true, sort_attrs: false

# Slim Set Shortcut
Slim::Engine.set_options shortcut: {
  '#' => {tag: 'div', attr: 'id'},
  '.' => {tag: 'div', attr: 'class'},
  '&' => {tag: 'input', attr: 'type'}
}

###
# Blog settings
###

Time.zone = 'Tokyo'

activate :blog do |blog|
  # This will add a prefix to all links, template references and source paths
  # blog.prefix = 'blog'

  # blog.permalink = "{year}/{month}/{day}/{title}.html"
  # Matcher for blog source files
  blog.sources = 'blog/{year}/{month}/{day}-{title}.html'
  # blog.taglink = "tags/{tag}.html"
  blog.layout = 'article_layout'
  # blog.summary_separator = /(READMORE)/
  # blog.summary_length = 250
  # blog.year_link = "{year}.html"
  # blog.month_link = "{year}/{month}.html"
  # blog.day_link = "{year}/{month}/{day}.html"
  blog.new_article_template = 'article_template.tt'
  blog.default_extension = '.md'

  blog.tag_template = 'tag.html'
  blog.calendar_template = 'calendar.html'

  # Enable pagination
  blog.paginate = true
  blog.per_page = 10
  blog.page_link = 'page/{num}'
end

page '/feed.xml', layout: false

###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", layout: false
#
# With alternative layout
# page "/path/to/file.html", layout: :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# activate :livereload

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

# middleman-syntax
activate :syntax, line_numbers: true
set :markdown_engine, :redcarpet
set :markdown, no_intra_emphasis: true, autolink: true, fenced_code_blocks: true, smartypants: true

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"

  # middleman-disqus
  activate :disqus do |d|
    d.shortname = 'kbaba1001githubio'
  end
end

# middleman-disqus
configure :development do
  activate :disqus do |d|
    # using a special shortname
    # d.shortname = "development-shortname"
    d.shortname = nil
  end
end

# middleman-deploy
activate :deploy do |deploy|
  deploy.method = :git
  # Optional Settings
  deploy.remote   = 'git@github.com:kbaba1001/kbaba1001.github.io.git' # remote name or git url, default: origin
  deploy.branch   = 'master' # default: gh-pages
  deploy.strategy = :force_push      # commit strategy: can be :force_push or :submodule, default: :force_push
  deploy.commit_message = "diary #{Time.now.strftime('%F %T')}"      # commit message (can be empty), default: Automated commit at `timestamp` by middleman-deploy `version`
end
