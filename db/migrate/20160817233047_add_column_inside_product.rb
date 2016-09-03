class AddColumnInsideProduct < ActiveRecord::Migration[5.0]
  def change
    #add_column :products, :category, :int, foreign_key: true, index: true
    add_reference :products, :category, index: true
  end
end




    # add_column :products, :price, :float
