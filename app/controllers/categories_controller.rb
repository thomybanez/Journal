class CategoriesController < ApplicationController
    before_action :authenticate_user!

    def index        
    end
 
    def new
    end

    def create
        @category = current_user.owned_categories.build(category_params)
        if @category.save
            redirect_to categories_index_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit        
    end

    def update                 
        if @categories_find.update(category_params)
            redirect_to categories_index_path
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def delete
        @categories_find.destroy
        redirect_to categories_index_path
        
    end

    def category_params
        params.require(:category).permit(:name, :user_id)
    end
end
