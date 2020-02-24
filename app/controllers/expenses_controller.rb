class ExpensesController < ApplicationController
  
  get '/expenses' do
    @user = current_user
    erb :'/expenses/index'
  end
  
  get '/expenses/new' do
    erb :'/expenses/new'
  end
  
  post '/expenses' do
    #create new expenses
    if !is_logged_in?
      flash[:errors] = "Please log in and try again"
      redirect to '/'
    end
    if params[:category] != ""
      @expense = Expense.create(category: params[:category], user_id: current_user.id)
      redirect to "/expenses/#{@expense.id}"
    else
      flash[:errors] = "Something went wrong - Please try again"
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
      if authorized?(@expense)
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
    if is_logged_in?
      if authorized?(@expense) && params[:category] != ""
        @expense.update(category: params[:category])
        redirect to "/expenses/#{@expense.id}"
      else
        flash[:errors] = "Something went wrong - Please try again"
        redirect to "/expenses/#{@expense.id}"
      end
    else
      redirect to '/'
    end
  end
  
  delete '/expenses/:id' do
    set_expense
    if authorized?(@expense)
      @expense.destroy
      redirect to '/expenses'
    else
      redirect to '/expenses'
    end
  end
  
  private
  
  def set_expense
    @expense = Expense.find(params[:id])
  end
  
end