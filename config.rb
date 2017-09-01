
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false
page '/sitemap.html', layout: false

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

# helpers do
#   def some_helper
#     'Helping'
#   end
# end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

# configure :build do
#   activate :minify_css
#   activate :minify_javascript
# end

# Activate external asset pipeline
configure :development do
  activate :livereload
end

ignore "*.sass"

activate :external_pipeline,
  name: :brunch,
  command: build? ? 'npm run prod' : 'npm start',
  source: "./public",
  latency: 1

activate :directory_indexes

set :markdown_engine, :redcarpet
set :markdown, fenced_code_blocks: true, smartypants: true

set :js_dir, 'assets/javascripts'
set :css_dir, 'assets/stylesheets'
set :images_dir, 'assets/images'
set :fonts_dir, 'assets/fonts'

# Build-specific configuration
configure :build do
  activate :asset_hash
  # Minify CSS on build
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript
  activate :robots, rules: [
    { user_agent: '*', allow: ['/']  }
  ],
  sitemap: "#{data.site.url}/sitemap.xml"
end

# activate :deploy do |deploy|
#   deploy.build_before = true
#   deploy.deploy_method = :git
# end
