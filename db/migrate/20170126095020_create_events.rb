class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.integer :category
      t.string  :title
      t.text    :desc
      t.string  :link_name
      t.text    :keywords
      t.string  :image
      t.boolean :enable, default: false

      t.timestamps
    end
  end
end
