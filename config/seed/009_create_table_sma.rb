#encoding: utf-8
=begin
#Cnd Database Sma create statement#
=end

class CreateTableSma < Sequel::Migration

  def up
    create_table(:sma) do
      primary_key   :id
    end
  end

  def down
    drop_table(:sma)
  end

end
