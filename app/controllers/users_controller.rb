class UsersController < ApplicationController
  
  get '/login' do
    erb :login
  end
  
  #create the session
  post '/login' do
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id #actually logs the user in
      puts session
      redirect to "/users/#{@user.id}"
    else
      flash[:message] = "There was an error logging in - Please try again or sign up"
      redirect to '/login'
    end
  end
  
  get '/signup' do
    erb :signup
  end
  
  post '/users' do
    if params[:name] != "" && params[:email] != "" && params[:password] != ""
      @user = User.create(params)
      session[:user_id] = @user.id
      #or redirect to '/login'
      redirect to "/users/#{@user.id}"
    else
      flash[:message] = "There was an error signing up - Please try again or log in"
      redirect to '/signup'
    end
  end
  
  get '/users/:id' do
    @user = User.find(params[:id])
    erb :'/users/show'
  end
  
  get '/logout' do
    session.clear
    redirect to '/'
  end
  
end