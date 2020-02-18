class ExpensesController < ApplicationController
  
  get '/expenses/new' do
    erb :'/expenses/new'
    #render a form to create new expenses
  end
  
  post '/expenses/new' do
    #create new expenses
  end
  
  
  
end