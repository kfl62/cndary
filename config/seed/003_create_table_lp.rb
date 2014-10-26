#encoding: utf-8
=begin
#Cnd Database Lp create statement#
=end

class CreateTableLp < Sequel::Migration

  def up
    create_table(:lp) do
      primary_key   :id
    end
  end

  def down
    drop_table(:lp)
  end

end
