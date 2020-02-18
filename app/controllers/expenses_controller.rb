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
    if is_logged_in?
      if @expense.user == current_user
        erb :'/expenses/edit'
      else
        redirect to "/users/#{current_user.id}"
      end
    else
      redirect '/'
    end
  end
  
  patch '/expenses/:id' do
    set_expense
    @expense.update(category: params[:category])
    redirect to "/expenses/#{@expense.id}"
  end
  
  private
  
  def set_expense
    @expense = Expense.find(params[:id])
  end
  
end