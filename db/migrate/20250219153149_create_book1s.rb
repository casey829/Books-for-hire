class CreateBook1s < ActiveRecord::Migration[8.0]
  def change
    create_table :book1s do |t|
      t.string :title
      t.string :author
      t.string :isbn

      t.timestamps
    end
  end
end
