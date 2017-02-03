class AddBannerStyleToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :banner_style, :integer, default: 1
  end
end
