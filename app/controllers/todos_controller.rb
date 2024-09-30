class TodosController < ApplicationController
  def index
    todos = Todo.limit(limit).offset(offset)
    render_ok count: todos.count, todos:
  end

  def show
    todo = Todo.find(params[:id])
    render_ok todo:
  end

  def create
    todo = Todo.create(todo_param)
    render_ok todo:
  end

  def update
    todo = Todo.find(params[:id])
    todo.update(todo_param)
    render_ok todo:
  end

  def destroy
    todo = Todo.find(params[:id])
    todo.destroy
    head :no_content, status: :ok
  end

  def count
    render json: { count: Todo.count }
  end

  private
    def todo_param
      params.require(:todo).permit(:title, :done)
    end
end
