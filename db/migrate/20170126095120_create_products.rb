class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :url
      t.integer :index
      t.string :banner
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
