class Borrowing < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :due_date, presence: true
  validate :user_can_borrow_more_books, on: :create
  validate :book_must_be_available, on: :create
  validate :user_has_no_overdue_books, on: :create

  before_validation :set_due_date, on: :create

  scope :active, -> { where(returned_at: nil) }
  scope :overdue, -> { active.where('due_date < ?', Date.current) }

  private

  def set_due_date
    self.due_date = 2.weeks.from_now.end_of_day
  end

  def book_must_be_available
    if book.present? && !book.available?
      errors.add(:book, "is already borrowed")
    end
  end

  def user_can_borrow_more_books
    if user.present? && !user.can_borrow_more_books?
      errors.add(:user, "has reached maximum number of borrowed books")
    end
  end

  def user_has_no_overdue_books
    if user.present? && user.has_overdue_books?
      errors.add(:user, "has overdue books that need to be returned first")
    end
  end
end
