#encoding: utf-8
=begin
#Cnd Database Pm create statement#
=end

class CreateTablePm < Sequel::Migration

  def up
    create_table(:pm) do
      primary_key   :id
    end
  end

  def down
    drop_table(:pm)
  end

end
