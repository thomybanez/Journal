class TaskController < ApplicationController

    def index        
    end

    def new        
    end

    def create
        @categories_tasks_create = Category.find(params[:category_id]).tasks.new(task_params)

        if @categories_tasks_create.save
            redirect_to categories_tasks_index_path
        else
            render :new, status: :unprocessable_entity
        end        
    end

    def edit               
    end

    def update
        if @categories_task_find.update(task_params)
            redirect_to categories_tasks_index_path
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def delete
        @categories_task_find.destroy
        redirect_to categories_tasks_index_path
    end
        
    def task_params
        params.require(:task).permit(:name, :description)
    end
end