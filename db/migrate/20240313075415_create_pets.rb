class CreatePets < ActiveRecord::Migration[6.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :gender
      t.string :kinds
      t.integer :user_id
      t.text :introduction

      t.timestamps
    end
  end
end
