class ChangeDescFieldsToProduct < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :desc, :text
  end
end
