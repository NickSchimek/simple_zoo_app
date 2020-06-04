class CreateZoos < ActiveRecord::Migration[6.0]
  def change
    create_table :zoos, id: :uuid do |t|
      t.string :name
      t.string :address

      t.timestamps
    end
  end
end
