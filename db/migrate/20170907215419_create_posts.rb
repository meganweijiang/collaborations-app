class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.belongs_to :user, index: true
      t.string :title
      t.string :description
      t.string :requirements
      t.string :location
      t.string :category
      t.timestamps
    end
  end
end
