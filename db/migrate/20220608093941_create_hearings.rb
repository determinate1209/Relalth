class CreateHearings < ActiveRecord::Migration[6.1]
  def change
    create_table :hearings do |t|
      t.integer :question1
      t.integer :question2
      t.integer :question3
      t.integer :question4
      t.timestamps
    end
  end
end
