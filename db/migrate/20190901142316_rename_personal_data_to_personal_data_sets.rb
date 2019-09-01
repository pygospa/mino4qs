class RenamePersonalDataToPersonalDataSets < ActiveRecord::Migration[6.0]
  def change
    rename_table :personal_data, :personal_data_sets
  end
end
