class ExpensesController < ApplicationController
  
  get '/expenses' do
    @user = current_user
    erb :'/expenses/index'
  end
  
  get '/expenses/new' do
    erb :'/expenses/new'
  end
  
  post '/expenses' do
    redirect_if_not_logged_in
    if params[:category] != "" && params[:cost] != ""
      flash[:message] = "Success!"
      @expense = Expense.create(category: params[:category],cost: params[:cost].to_s, user_id: current_user.id)
      redirect to "/expenses/#{@expense.id}"
    else
      flash[:errors] = "Something went wrong - Please be sure to fill out all fields"
      redirect to '/expenses/new'
    end
  end
  
  get '/expenses/:id' do
    set_expense
    erb :'/expenses/show'
  end
  
  get '/expenses/:id/edit' do
    set_expense
    redirect_if_not_logged_in
    if authorized?(@expense)
      erb :'/expenses/edit'
    else
      redirect to "/users/#{current_user.id}"
    end
  end
  
  patch '/expenses/:id' do
    set_expense
    redirect_if_not_logged_in
    if authorized?(@expense) && params[:category] != ""
      @expense.update(category: params[:category], cost: params[:cost])
      redirect to "/expenses/#{@expense.id}"
    else
      flash[:errors] = "Something went wrong - Please try again"
      redirect to "/expenses/#{@expense.id}"
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