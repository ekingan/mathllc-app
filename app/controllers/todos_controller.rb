class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  def index
    @todos = Todo.where(user_id: current_user.id)
    @user_id = current_user.id.to_s
  end

  def create
    todo = Todo.new(todo_params)
    todo.user_id = current_user.id 
    if todo.save
      render json: todo
    else
      render json: { success: false }
    end
  end

  def update
    todo = Todo.find(params[:id])
    todo.update_attributes(todo_params)
    render json: todo
  end

  def destroy
    todo = Todo.find(params[:id])
    todo.destroy
    head :no_content, status: :ok
  end

  def sort
    byebug
  end
  
  private

  def todo_params
    params.require(:todo).permit(:title, :done, :user_id, :position)
  end

end
