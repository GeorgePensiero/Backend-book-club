class Api::BooksController < ApplicationController

    def index
        @books = Books.all
    end

    def create
        @book = Book.new(book_params)
        if @book.save
            render :show
        else
            render json: @book.errors.full_messages, status: 422
        end
    end

    


    private 

    def book_params
        params.require(:book).permit(:title, :location, :user_id, :image)
    end
end
