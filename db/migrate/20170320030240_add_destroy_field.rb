class AddDestroyField < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :hidden, :boolean, default: false
    add_column :products, :hidden, :boolean, default: false
  end
end
