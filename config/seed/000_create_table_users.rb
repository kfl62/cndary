#encoding: utf-8
=begin
#Cnd Database Users create statement#
=end

class CreateTableUsers < Sequel::Migration

  def up
    create_table(:users) do
      primary_key   :id
    end
  end

  def down
    drop_table(:users)
  end

end
