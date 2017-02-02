class ChangeFieldsToProduct < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :url, :text
  end
end
