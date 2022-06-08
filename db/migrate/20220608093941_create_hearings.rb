class CreateHearings < ActiveRecord::Migration[6.1]
  def change
    create_table :hearings do |t|
      t.string :question
      t.timestamps
    end
  end
end
