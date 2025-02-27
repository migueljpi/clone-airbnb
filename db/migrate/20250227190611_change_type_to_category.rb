class ChangeTypeToCategory < ActiveRecord::Migration[7.2]
  def change
    rename_column :tours, :type, :category
  end
end
