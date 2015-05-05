class ListsController < ApplicationController

  def new
    @list = List.new
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @task = Task.new
    @task.list_id = @list.id
  end

  def create
    @list = List.new(list_params)
    if @list.save
      flash.notice = "#{@list.title} List created!"
      redirect_to lists_path
    else
      flash.notice = "oh no, your list title sucked, please try again"
      render :new
    end
  end

  def destroy
    @list = List.find(params[:id])
    if @list.status == true
      @list.delete
      flash.notice = "#{@list.title} List deleted!"
      redirect_to lists_path
    else
      flash.notice = "Sorry, the #{@list.title} List cannot deleted because it is has not been archived!"
      render :show
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    @list.update(list_params)
    flash.notice = "#{@list.title} List updated!"
    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:title, :status)
  end

end
