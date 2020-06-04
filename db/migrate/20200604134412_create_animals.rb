class CreateAnimals < ActiveRecord::Migration[6.0]
  def change
    create_table :animals, id: :uuid do |t|
      t.string :name
      t.string :bio
      t.references :zoo, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
