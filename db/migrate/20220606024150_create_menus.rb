class CreateMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :menus do |t|
      t.integer :plan_id
      t.integer :customer_id
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
