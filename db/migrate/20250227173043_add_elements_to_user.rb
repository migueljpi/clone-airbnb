class AddElementsToUser < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :age, :integer
    add_column :users, :guide, :boolean
    add_column :users, :about_me, :text
    add_column :users, :language, :string

  end
end
