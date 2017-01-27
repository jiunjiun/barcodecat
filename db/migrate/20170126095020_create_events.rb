class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :desc
      t.string :link_name
      t.boolean :enable, default: false

      t.timestamps
    end
  end
end
