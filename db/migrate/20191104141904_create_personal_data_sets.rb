class CreatePersonalDataSets < ActiveRecord::Migration[6.0]
  def change
    create_table :personal_data_sets do |t|
      t.date    :birthday
      t.string  :gender
      t.integer :height
    end
  end
end
