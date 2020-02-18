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
  
  get '/expenses/:id' do
    set_expense
    erb :'/expenses/show'
  end
  
  get '/expenses/:id/edit' do
    set_expense
    erb :'/expenses/edit'
  end
  
  patch '/expenses/:id' do
    "Hello, World!"
  end
  
  private
  
  def set_expense
    @expense = Expense.find(params[:id])
  end
  
end