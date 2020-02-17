class UsersController < ApplicationController
  
  get '/login' do
    erb :'/users/login'
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
    erb :'/users/signup'
  end
  
  get '/users/:id' do
    
  end
  
end