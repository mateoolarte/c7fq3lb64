class ExpensesController < ApplicationController
  def index
    if params[:concept].present? && params[:category_id].present?
      @expenses = Expense.where('concept LIKE ? AND category_id LIKE ?', "%#{params[:concept]}%", "%#{params[:category_id]}%")
    elsif params[:concept].present?
      @expenses = Expense.where('concept LIKE ?', "%#{params[:concept]}%")
    elsif params[:category_id].present?
      @expenses = Expense.where('category_id LIKE ?', "%#{params[:category_id]}%")
    else
      @expenses = Expense.order("date DESC")
    end  
  end
end
