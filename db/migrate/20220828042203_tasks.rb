class Tasks < ActiveRecord::Migration[6.1]
  def change
    drop_table :materials
  end
end
