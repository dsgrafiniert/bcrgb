require 'middleman-livereload'
require 'susy'
###
# Compass
###

# Susy grids in Compass
# First: gem install compass-susy-plugin

# require 'bootstrap-sass'

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

page "/archiv/*", layout: :archive_layout
page "/nights/*", layout: :nights_layout

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

activate :livereload
activate :dotenv

activate :deploy do |deploy|
  deploy.method = :rsync
  deploy.host = ENV["DEPLOY_HOST"]
  deploy.user = ENV["DEPLOY_USER"]
  deploy.path = ENV["DEPLOY_PATH"]
  deploy.clean = true # cleans EVERYTHING including ssh keys ...
end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Change the CSS directory
# set :css_dir, "alternative_css_directory"

# Change the JS directory
# set :js_dir, "alternative_js_directory"

# Change the images directory
# set :images_dir, "alternative_image_directory"

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  compass_config do |config|
    config.output_style = :compressed
    config.sass_options = { :line_comments => false, :debug_info => false }
  end
  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  activate :cache_buster

  # Use relative URLs
  # activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"
end
