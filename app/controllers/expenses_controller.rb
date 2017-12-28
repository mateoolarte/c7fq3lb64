class ExpensesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(current_user)
    @expenses = @user.expenses.all.order("date DESC")
    # @expenses = Expense.order("date DESC")
    if params[:concept].present?
      @expenses = @expenses.where("concept LIKE ?", "%#{params[:concept]}%")
    end
    if params[:category_id].present?
      @expenses = @expenses.where("category_id = ?", params[:category_id])
    end
  end
  
  # private
  # def method_name
    
  # end
end
