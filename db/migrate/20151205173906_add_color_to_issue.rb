class AddColorToIssue < ActiveRecord::Migration[5.2]
  def change
    add_column :issues, :color, :string
  end
end
