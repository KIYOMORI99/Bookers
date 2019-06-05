class UsersController < ApplicationController
    def index
        @users = User.all
        @user = current_user
        @post_book = PostBook.new   
    end
    
    def show
        @user = User.find(params[:id])
        @post_books = @user.post_books
        @post_book = PostBook.new
    end
    
    def edit
        @user = User.find(params[:id])
    end
    
    
    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            flash[:notice] = 'You have created book successfully.'
            redirect_to user_path(@user.id)
        else
            render :edit
        end
    end
    
    
    
    private
    def user_params
        params.require(:user).permit(:name, :introduction, :profile_image)
    end
    
end
