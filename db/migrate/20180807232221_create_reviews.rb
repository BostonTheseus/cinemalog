class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.text :message
      t.string :rating
      t.integer :user_id
      t.integer :movie_id
      t.timestamps
    end

    add_index :reviews, [:user_id, :movie_id]
    add_index :reviews, :movie_id
  end
end