class UserSessionsController < ApplicationController
    def new; end
  
    def create
      @user = login(params[:email], params[:password])
      if @user
        redirect_back_or_to @user
      else
        render :new
      end
    end
  
    def destroy
      logout
      redirect_to new_user_url
    end
  end
