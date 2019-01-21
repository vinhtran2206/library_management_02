class BooksController < ApplicationController
  include BooksHelper

  before_action :load_book, only: %i(show edit update)

  def new
    @book = Book.new
  end

  def create
    @book = Book.new books_params
    if @book.save
      flash[:success] = t ".success_message"
      redirect_to @book
    else
      render :new
    end
  end

  def show
    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit; end

  def index
    @books = Book.alphabet.search_book(params[:search])
      .paginate page: params[:page],per_page: Settings.book.per_page
  end

  def update
    if @book.update_attributes books_params
      flash[:success] = t ".update_success"
      redirect_to @book
    else
      render :edit
    end
  end

  private
  def books_params
    params.require(:book).permit :name, :description, :num_of_pages, :image,
      :amount, :author_id, :category_id, :publisher_id
  end

  def load_book
    @book = Book.find_by id: params[:id]
    return if @book
    flash[:danger] = t "books.load_book.error_message"
    redirect_to root_path
  end
end
