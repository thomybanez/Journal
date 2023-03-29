class ApplicationController < ActionController::Base
    before_action :load_categories

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def authenticate_user!
    redirect_to sessions_login_path, alert: "Please log in to access this page." unless current_user
    end
    helper_method :current_user

  
    
    def load_categories
        # @categories_all = Category.all
        # @categories_new = Category.new
        # @categories_find = Category.find(params[:category_id]) if params[:category_id].present?
        
        @categories_tasks = Category.find(params[:category_id]).tasks if params[:category_id].present?
        @categories_task_find = Category.find(params[:category_id]).tasks.find(params[:id]) if (params[:category_id].present? && params[:id].present?)        
        
        @categories_tasks_new = Category.find(params[:category_id]).tasks.new if params[:category_id].present?

        if current_user.present?
            @categories_all = current_user.owned_categories
          else
            # handle the case where current_user is nil
            # for example, you could redirect to a login page
          end
        
        @categories_new = Category.new
        @categories_find = Category.find(params[:category_id]) if params[:category_id].present?
                
    end
end