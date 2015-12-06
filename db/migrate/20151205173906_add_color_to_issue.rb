class AddColorToIssue < ActiveRecord::Migration
  def change
    add_column :issues, :color, :string
  end
end
