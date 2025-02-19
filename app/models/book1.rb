class Book1 < ApplicationRecord
   has_many :borrowings, dependent: :destroy
   has_many :users, through: :borrowings


   validates :title, presence: true, length: { minimum: 2, maximum: 200}
   validates :author, presence: true, length: {minimum: 2, maximum: 100}
   validates :isbn, presence: true,
                   uniqueness: true,
                   format: { with: /\A(?=(?:\D*\d){10}(?:(?:\D*\d){3})?$)[\d-]+\z/}
   scope :available, -> { where.not(id: Borrowing.active.select(:book_id))}
   scope :borrowed, ->  {where(id: Borrowing.active.select(:book_id))}


   def available?
     !borrowings.active.exists?
   end

   def current_borrowing
     borrowings.active.first
   end

   def current_borrower
     current_borrowing&.user
   end

end
