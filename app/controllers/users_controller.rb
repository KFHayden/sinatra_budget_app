class UsersController < ApplicationController
  
  get '/login' do
    erb :login
  end
  
  #create the session
  post '/login' do
    @user = User.find_by(email: params[:email])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id #actually logs the user in
      puts session
      redirect to "/users/#{@user.id}"
    else
      "Your username and/or password are invalid"
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
      redirect to '/signup'
      #stretch goal - create an error page or give an error message
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