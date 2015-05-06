class TasksController < ApplicationController
  def create
    @task = Task.new(task_params)
    @task.list_id = params[:list_id]
    @task.save
    redirect_to list_path(@task.list_id)
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    flash.notice = "#{@task.title} Task updated!"
    redirect_to list_path(@task.list_id)
  end

  def delete_pic
    @task = Task.find(params[:id])
    @task.pdf = nil
    @task.save
    redirect_to list_path(@task.list_id)
  end

  def task_params
    params.require(:task).permit(:title, :status, :description, :due_date, :pdf)
  end
end
