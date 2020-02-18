class ExpensesController < ApplicationController
  
  get '/expenses/new' do
    erb :'/expenses/new'
  end
  
  post '/expenses' do
    #create new expenses
  end
  
  
  
end