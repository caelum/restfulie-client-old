class CreatePriceField < ActiveRecord::Migration
  def self.up
    add_column :trainings, :price, :float
  end

  def self.down
    remove_column :trainings, :price
  end
end
