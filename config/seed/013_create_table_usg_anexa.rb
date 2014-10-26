#encoding: utf-8
=begin
#Cnd Database UsgAnexa create statement#
=end

class CreateTableUsgAnexa < Sequel::Migration

  def up
    create_table(:usg_anexa) do
      primary_key   :id
    end
  end

  def down
    drop_table(:usg_anexa)
  end

end
