# encoding: utf-8

# Enables support for Compass, a stylesheet authoring framework based on SASS.
# See http://compass-style.org/ for more details.
module CompassInitializer
  def self.registered(app)
    require 'sass/plugin/rack'

    Compass.configuration do |config|
      config.project_path     = Cnd.root
      config.sass_dir         = Cnd.firm.sass_dir
      config.css_dir          = Cnd.firm.css_dir
      config.images_dir       = Cnd.firm.images_dir
      config.http_images_path = Cnd.firm.images_dir.gsub('public','')
      config.output_style = :compact
      config.sass_options = {cache_location: "./tmp/sass-cache", line_comments: false}
    end

    Compass.configure_sass_plugin!
    Compass.handle_configuration_change!

    app.use Sass::Plugin::Rack
  end
end
