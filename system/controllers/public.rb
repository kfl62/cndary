# encoding: utf-8
require_relative 'db'
module Cnd
  # ##Description
  # ##Scope
  # @todo documentation
  class Public  < Sinatra::Base
    include Db
    register Sinatra::Flash
    register Cnd::Helpers
    set :views, File.join(Cnd.views,'public')

    if Cnd.env == 'development'
      use Assets::Stylesheets
      use Assets::Javascripts
    end

    get '/' do
      haml :index
    end
  end # System
end # Cnd
