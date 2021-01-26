class CreateDogs < ActiveRecord::Migration[6.0]
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :breed
      t.string :size
      t.string :category
      t.string :description
      t.boolean :hypoallergenic, default: false
      t.references :user, null: false, foreign_key: true
      t.string :city

      t.timestamps
    end
  end
end
