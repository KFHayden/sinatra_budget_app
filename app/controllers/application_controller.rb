require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "budget app"
    register Sinatra::Flash
  end

  get "/" do
    if is_logged_in?
      redirect to "/users/#{current_user.id}"
    else
      erb :welcome
    end
  end
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  def is_logged_in?
    !!current_user
  end
  
  def authorized?(expense)
    expense.user == current_user
  end

end