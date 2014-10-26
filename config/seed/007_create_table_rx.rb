#encoding: utf-8
=begin
#Cnd Database Rx create statement#
=end

class CreateTableRx < Sequel::Migration

  def up
    create_table(:rx) do
      primary_key   :id
    end
  end

  def down
    drop_table(:rx)
  end

end
