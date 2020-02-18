class ExpensesController < ApplicationController
  
  get '/expenses/new' do
    erb :'/expenses/new'
  end
  
  post '/expenses' do
    #create new expenses
    if !is_logged_in?
      redirect to '/'
    end
    if params[:category] != ""
      @expense = Expense.create(category: params[:category], user_id: current_user.id)
      redirect to "/expenses/#{@expense.id}"
    else
      redirect to '/expenses/new'
    end
  end
  
  
  
end