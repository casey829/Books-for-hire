class UsersController < ApplicationController
  before_action :authenticate_user!


  def profile
    @pagy, @borrowed_books = pagy(current_user.currently_borrowed_books
                                              .includes(:borrowings))
    @overdue_books = current_user.currently_borrowed_books
                                .merge(Borrowing.overdue)
  end
end
