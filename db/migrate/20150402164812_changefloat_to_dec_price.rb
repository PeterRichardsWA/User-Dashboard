class ChangefloatToDecPrice < ActiveRecord::Migration
  def change
  	change_column(Product, :pricing, :decimal)
  end
end
