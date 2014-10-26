#encoding: utf-8
=begin
#Cnd Database LpAnexa create statement#
=end

class CreateTableLpAnexa < Sequel::Migration

  def up
    create_table(:lp_anexa) do
      primary_key   :id
    end
  end

  def down
    drop_table(:lp_anexa)
  end

end
