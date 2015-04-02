class AddCatFieldProducts < ActiveRecord::Migration
  def change
  	add_reference(Product, Category, index: true )
  end
end
