class SessionsController < ApplicationController

    def login
    end

    def login_create
      if params[:login].present? && params[:login][:username].present? && params[:login][:password_digest].present?
        user = User.authenticate(params[:login][:username], params[:login][:password_digest])
        if user
          session[:user_id] = user.id
          redirect_to categories_index_path, notice: 'Successfully logged in!'
          @message = "Successfully logged in as #{user.username}"
        else
          flash.now[:alert] = 'Invalid username or password'
          @message = 'Invalid username or password'
        end
      else
        @message = 'Please enter your username and password'
      end
    end

    def logout
        session[:user_id] = nil
        redirect_to sessions_login_path, notice: "Logged out!"
    end

    def signup        
    end

    def signup_create
        @user = User.new(signup_params) 
        if @user.save
          # user successfully created
        else
          flash.now[:alert] = @user.errors.full_messages.join(", ")
          render :signup
        end
      end

    def signup_params        
            signup_params = params.require(:signup).permit(:username, :password, :confirm_password)
    end

    def login_params        
            login_params = params.require(:login).permit(:username, :password_digest)        
    end
end
