class CreateMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :menus do |t|
      
      t.integer :customer_id
      t.string :name
      t.string :description
      t.integer :plan_name, defaut: 9
      t.integer :site_name

      t.timestamps
    end
  end
end
