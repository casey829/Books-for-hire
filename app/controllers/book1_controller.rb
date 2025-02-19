class Book1Controller < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_book, only: [:show, :borrow, :return]


  def index
    @pagy, @book1 = pagy(Book1.all.includes(:borrowings))
  end

  def show
    @current_borrowing = @book1.current_borrowing
  end

  def borrow
    borrowing = current_user.borrowings.build(book1: @book1)
    
    if borrowing.save
      redirect_to @book1, notice: 'Book was successfully borrowed.'
    else
      redirect_to @book1, alert: borrowing.errors.full_messages.to_sentence
    end
  end

  def return
    borrowing = @book1.current_borrowing
    
    if borrowing&.user == current_user && borrowing.update(returned_at: Time.current)
      redirect_to @book1, notice: 'Book was successfully returned.'
    else
      redirect_to @book1, alert: 'Unable to return book.'
    end
  end

  private

  def set_book
    @book1 = Book1.find(params[:id])
  end
end