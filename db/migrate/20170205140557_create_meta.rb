class CreateMeta < ActiveRecord::Migration[5.0]
  def change
    create_table :meta do |t|
      t.references :event, foreign_key: true
      t.text :desc
      t.text :keywords
      t.string :image

      t.timestamps
    end
  end
end
