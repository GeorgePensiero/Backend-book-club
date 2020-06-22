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

    def show
        @book = Books.find(params[:id])
    end

    def destroy
        @book = Books.find(params[:id])
        @book.destroy
        render :show
    end

    def update
        @book = Books.find(params[:id])
        if @book.update(book_params)
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
