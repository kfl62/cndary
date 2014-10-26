#encoding: utf-8
=begin
#Cnd Database Gammes create statement#
=end

class CreateTableGamma < Sequel::Migration

  def up
    create_table(:gamma) do
      primary_key   :id
    end
  end

  def down
    drop_table(:gamma)
  end

end
