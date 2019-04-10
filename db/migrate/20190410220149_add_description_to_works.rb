class AddDescriptionToWorks < ActiveRecord::Migration[5.2]
  def change
    add_column :works, :description, :text
    add_column :works, :created_at, :datetime
    add_column :works, :updated_at, :datetime
  end
end
