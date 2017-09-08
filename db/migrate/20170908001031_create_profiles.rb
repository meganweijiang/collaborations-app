class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :location
      t.string :skills
      t.string :bio
      t.timestamps
    end
  end
end
