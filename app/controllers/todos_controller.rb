class TodosController < ApplicationController

	def index
		@todos = Todo.all
	end

	def new
		@todo = Todo.new
	end

	def create
		@todo = Todo.new(params[:todo].permit(:title, :description, :completed))
		if @todo.save
			redirect_to @todo
		else
			render 'new'
		end
	end

	def show
		@todo = Todo.find(params[:id])
	end

	private 
		def todo_params
			params.require(:todo).permit(:title, :desctiption, :completed)
		end


end