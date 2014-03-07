class TodosController < ApplicationController

	def index
	end

	def new
		@todo = Todo.new
	end

	def create
		@todo = Todo.create(params[:todo].permit(:title, :description, :completed))
		if @todo.save
			render 'todos'
		else
			render 'new'
		end
	end

	private 
		def todo_params
			params.require(:todo).permit(:title, :desctiption, :completed)
		end


end