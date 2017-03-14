#encoding: utf-8
=begin
#Cnd Database Users create statement#
=end

class CreateTableUsers < Sequel::Migration

  def up
    create_table(:users) do
      column :login_name,     "varchar(50)",    null: false
      column :name,           "varchar(100)"
      column :email,          "varchar(100)"
      column :hashed_password,"varchar(60)"
      column :last_login,     "datetime"

      primary_key :id, :type=>"smallint(6)"
    end
  end

  def down
    drop_table(:users)
  end

end
