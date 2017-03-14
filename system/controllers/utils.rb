# encoding: utf-8
require_relative 'db'
module Cnd
  # ##Description
  # ##Scope
  # @todo documentation
  class Utils < Sinatra::Base
    include Db
    register Sinatra::Flash
    register Cnd::Helpers
    set :views, File.join(Cnd.views, 'utils')

    if Cnd.env == 'development'
      use Assets::Stylesheets
      use Assets::Javascripts
    end

    # Authentication
    get '/login' do
      haml :login, :layout  => false
    end
    post '/login' do
      if Date.today == Date.new(*params[:cdate].split('-').map(&:to_i))
        if user = Users.authenticate(params[:name], params[:password])
          session[:user] = user.id
          user.set(last_login: Time.now)
          flash[:msg] = {msg: {txt: t('msg.login.start'), cls: "info"}}
          redirect "#{lp}/sys"
        else
          flash[:msg] = {msg: {txt: t('msg.login.error'), cls: "error"}}
          redirect "#{lp}/"
        end
      else
        flash[:msg] = {msg: {txt: t('msg.login.error_date'), cls: "error"}}
        redirect "#{lp}/"
      end
    end
    # Logout
    get '/logout' do
      session[:user] = nil
      flash[:msg] = {msg: {txt:t('msg.login.end'), cls: "info"}}
      redirect "#{lp}/"
    end
    # @todo Document this method
    post '/msg' do
      w, k, d = params[:what], params[:kind], params[:data]
      if w == 'flash'
        retval = flash[:msg] || {msg: {txt: t('msg.loading'), cls: "loading"}}
      else
        retval = {msg: {txt: t(w, data: d), cls: k}}
      end
      retval.to_json
    end
    # @todo Document this method
    get '/lang/:lang' do |l|
      I18n.locale = l.to_sym
      path = session[:user].nil? ?  "#{lp}/" :  "#{lp}/sys"
      flash[:msg] = {msg: {txt: t('msg.lang.start'), cls: "info"}}
      redirect path
    end
  end # Utils
end # Cnd
