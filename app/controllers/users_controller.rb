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
      flash[:message] = "Welcome, #{@user.name}!"
      redirect to "/users/#{@user.id}"
    else
      flash[:errors] = "There was an error logging in - Please try again or sign up"
      redirect to '/login'
    end
  end
  
  get '/signup' do
    erb :signup
  end
  
  post '/users' do
    @user = User.new(params)
    if @user.save
      session[:user_id] = @user.id
      flash[:message] = "Welcome, #{@user.name}!"
      redirect to "/users/#{@user.id}"
    else
      flash[:errors] = "There was an error signing up - #{@user.errors.full_messages.to_sentence}"
      redirect to '/signup'
    end
  end
  
  get '/users/:id' do
    redirect_if_not_logged_in
    @user = User.find(params[:id])
    erb :'/users/show'
  end
  
  get '/logout' do
    session.clear
    redirect to '/'
  end
  
end