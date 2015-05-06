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
    redirect_to list_task_path(@task.list_id, @task.id)
  end

  def archive
    @list = List.find(params[:id])
    @task = Task.new
    @task.list_id = @list.id

    @sorted_tasks = Task.where(nil)
    sorting_params(params).each do |key, value|
      @sorted_tasks = @list.tasks.public_send(key)
    end
  end

  def delete_pic
    @task = Task.find(params[:id])
    @task.pdf = nil
    @task.save
    redirect_to list_task_path(@task.list_id, @task.id)
  end

  def sorting_params(params)
    params.slice(:name_sort, :date_sort, :status_sort)
  end

  private

  def task_params
    params.require(:task).permit(:title, :status, :description, :due_date, :pdf)
  end
end
