class PostBooksController < ApplicationController
    
    def index
        @post_books = PostBook.all
        @post_book = PostBook.new
        @user = current_user
    end
    
    def show
        @post_book = PostBook.new
        @post_books = PostBook.find(params[:id])
        @user = @post_books.user
    end
    
    def edit
        @post_book = PostBook.find(params[:id])
    end
    
    def create
        @post_book = PostBook.new(post_book_params)
        @post_book.user_id = current_user.id
        if @post_book.save
            flash[:notice] = 'You have created book successfully.'
            redirect_to post_books_path
        else
            @post_books = PostBook.all
            @user = current_user
            render 'index'
        end
    end
    
     def update
        @post_book = PostBook.find(params[:id])
        if @post_book.update(post_book_params)
            flash[:notice]  = 'You have updated book successfully.'
            redirect_to post_books_path
        else
            render :edit
        end
    end
    
    def destroy
	    @post_book = PostBook.find(params[:id])
	    @post_book.destroy
	    redirect_to post_books_path(@post_book.user_id)
	end
    
    private
    
    def post_book_params
        params.require(:post_book).permit(:title, :opinion)
    end
end