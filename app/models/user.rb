class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :borrowings, dependent: :destroy
  has_many :books, through: :borrowings
  has_many :active_borrowings, -> { where(returned_at: nil)},
           class_name: 'Borrowing'

  has_many :currently_borrowed_books,
           through: :active_borrowings,
           source: :book

  def can_borrow_more_books?
    active_borrowings.count < 5
end

  def has_overdue_books?
    active_borrowings.where('due_date < ?', Date.current).exists?
  end
end