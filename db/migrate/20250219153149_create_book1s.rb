class CreateBook1s < ActiveRecord::Migration[8.0]
  def change
    create_table :book1s do |t|
      t.string :title
      t.string :author
      t.string :isbn

      t.timestamps
    end

    add_index :book1s, :isbn, unique: true
  end
end
