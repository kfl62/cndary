# encoding: utf-8
require_relative 'db'
module Cnd
  # ##Description
  # ##Scope
  # @todo documentation
  class System < Sinatra::Base
    include Db
    register Sinatra::Flash
    register Cnd::Helpers
    set :views, File.join(Cnd.views, 'system')

    if Cnd.env == 'development'
      use Assets::Stylesheets
      use Assets::Javascripts
    end

    before do
      if session[:user]
        @current_user ||= Users.find(id: session[:user])
        @today        ||= Date.today
        I18n.reload! if Cnd.env == 'development'
        if Time.now > Time.now.end_of_month - 4.hours
          flash[:msg] = {msg: {txt: t('msg.login.monthly_revision'), cls: 'error'}}
          redirect  "#{lp}/"
        end unless @current_user.root?
      else
        flash[:msg] = {msg: {txt: t('msg.login.required'), cls: 'error'}}
        redirect  "#{lp}/"
      end
    end

    get '/' do
      haml :index
    end
  end # System
end # Cnd
