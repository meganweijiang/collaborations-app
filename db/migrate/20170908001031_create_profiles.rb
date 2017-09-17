class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.belongs_to :user, index: true
      t.string :image
      t.string :location
      t.string :skills
      t.string :bio
      t.timestamps
    end
  end
end
