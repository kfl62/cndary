#encoding: utf-8
=begin
#Cnd Database UsAnexa create statement#
=end

class CreateTableUsAnexa < Sequel::Migration

  def up
    create_table(:us_anexa) do
      primary_key   :id
    end
  end

  def down
    drop_table(:us_anexa)
  end

end
