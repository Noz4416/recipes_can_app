class AddConversionToUnits < ActiveRecord::Migration[6.1]
  def change
    add_column :units, :conversion, :boolean, default: false, null: false
  end
end
