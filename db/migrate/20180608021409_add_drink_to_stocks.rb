class AddDrinkToStocks < ActiveRecord::Migration
  def change
  	add_reference :stocks, :drink, foreign_key: true
  end
end
