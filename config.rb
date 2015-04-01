@siteName = "Tom Gillard"
@siteUrl = "http://tomgillard.com"

# silence i18n warning
::I18n.config.enforce_available_locales = false

# feed.xml.builder
require "builder"

# ignore files
ignore "/feed-test.xml"
ignore "/README.md"

###
# Blog
###

# Set local timezone for post dates
require 'tzinfo'
Time.zone = "Australia/Melbourne"

# Blog options
activate :blog do |blog|
  blog.prefix = "blog"
  blog.layout = "blog"
  blog.permalink = ":year-:month-:day-:title"
  blog.default_extension = ".markdown"
  # tags -> topics
  blog.tag_template = "single-topic.html"
  blog.taglink = "topics/:tag.html"
  # pagination
  blog.paginate = true
  blog.page_link = "page:num"
  blog.per_page = 5
end

# Markdown settings
set :markdown_engine, :kramdown
set :markdown, :fenced_code_blocks => true,
:autolink => true,
:smartypants => true


# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes
activate :automatic_alt_tags


###
# Helpers - Methods defined in the helpers block are available in templates
###
helpers do
  # Sets the html class to 'is-current-page' when the link url is equal to the current page being viewed.
  # Use just like the link_to helper.
  # <%= current_link_to 'Home', '/index.html' %>
  def current_link_to(text, url, opts={})
      current_url = current_resource.url
      if current_url == url_for(url) || current_url == url_for(url) + "/"
          opts[:class] = "is-current-page"
      end
      link_to(text, url, opts)
  end
end

####
# Pretty URLS
####

# Apache - outputs: site/pagename.html to site/page-name/index.html
activate :directory_indexes

# Set a different file to be output from .html
# php: index.php || IIS: default.html
# set :index_file, "default.html"

# ignore pretty url on individual files
page "/404.html", directory_index: false
page "/sitemap.xml", directory_index: false
page "/feed.xml", directory_index: false

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
page "/feed.xml", :layout => false
page "/sitemap.xml", :layout => false


# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end
# data.projects.details.each do |pd|
#   proxy "/projects/#{pd[:client]}.html", "/projects/template.html", :layout => :popup, :locals => { :project => pd }, :ignore => true
# end

####
# Folder Locations
####

set :css_dir, 'css'
set :js_dir, 'js'
set :images_dir, 'img'

###
# Compass
###
compass_config do |config|
  config.preferred_syntax = :scss
end

####
# Build-specific configuration
####

configure :development do

  compass_config do |config|

    config.sass_options = {:debug_info => true}
    config.output_style = :expanded
    config.line_comments = true

  end

  # Livereload in browser
  # First: gem install middleman-livereload
  activate :livereload

end

configure :build do

  compass_config do |config|
    config.output_style = :compressed
    config.line_comments = false
  end

  # Minify CSS on build
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Minify HTML on build
  # First: gem install middleman-minify-html
  activate :minify_html

  # GZIP files - requires setup on server
  activate :gzip

  # Uniquely-named assets
  # activate :asset_hash

  # Enable cache buster - older than above
  # activate :cache_buster

  # Use relative URLs
  # activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  require "middleman-smusher"
  activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"
end

###
# Deployment settings - Github user page (http://tgdev.github.com/)
###
activate :deploy do |deploy|
  deploy.method = :git
  deploy.build_before = true # default: false
  deploy.branch = "master"
  # deploy.remote   = "git@github.com:tgdev/tgdev.github.com.git"
end