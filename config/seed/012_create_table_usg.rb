#encoding: utf-8
=begin
#Cnd Database Usg create statement#
=end

class CreateTableUsg < Sequel::Migration

  def up
    create_table(:usg) do
      primary_key   :id
    end
  end

  def down
    drop_table(:usg)
  end

end
