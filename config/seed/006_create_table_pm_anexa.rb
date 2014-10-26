#encoding: utf-8
=begin
#Cnd Database PmAnexa create statement#
=end

class CreateTablePmAnexa < Sequel::Migration

  def up
    create_table(:pm_anexa) do
      primary_key   :id
    end
  end

  def down
    drop_table(:pm_anexa)
  end

end
