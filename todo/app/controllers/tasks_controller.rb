class TasksController < ApplicationController
  def index
  	@task = Task.new
  	@tasks = Task.all
  end

  def create
  	Task.create(task_params)
  	redirect_to :back
  end

  def edit
  	@task = Task.find(params[:id])
  end

  def update
  	task = Task.find params[:id]

  	if task.update(task_params)
  		redirect_to tasks_path
  	else
  		redirect_to :back
  	end
  end

  private
	  def task_params
	  		params.require(:task).permit(:task)
	  end

end
