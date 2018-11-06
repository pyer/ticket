class Setup < ActiveRecord::Migration[5.2]

  def self.up

    create_table :statuses do |t|
      t.column "name",  :string
      t.column "image", :string
      t.column "created_on", :timestamp, :null => false
      t.column "updated_on", :timestamp
    end
    add_index :statuses, ["name"], :name => "statuses_name"

    create_table :users do |t|
      t.column "login",      :string, :null => false
      t.column "password",   :string
      t.column "name",       :string, :null => false
      t.column "admin",      :boolean, :default => false, :null => false
      t.column "status",     :string
      t.column "last_login_on", :timestamp
      t.column "created_on", :timestamp, :null => false
      t.column "updated_on", :timestamp
    end
    add_index :users, ["login"], :name => "users_login"

    create_table :projects do |t|
      t.column "name", :string, :default => "", :null => false
      t.column "description", :text
      t.column "created_on", :timestamp, :null => false
      t.column "created_by", :string
      t.column "updated_on", :timestamp
      t.column "updated_by", :string
    end

    create_table :issues, :force => true do |t|
      t.column "description", :text
      t.column "status", :string
      t.column "project_id", :integer, :default => 0, :null => false
      t.column "created_on", :timestamp, :null => false
      t.column "created_by", :string
      t.column "updated_on", :timestamp
      t.column "updated_by", :string
    end

  end

  def self.down
    drop_table :statuses
    drop_table :users
    drop_table :projects
    drop_table :issues
  end

end
