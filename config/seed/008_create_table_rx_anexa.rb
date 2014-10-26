#encoding: utf-8
=begin
#Cnd Database RxAnexa create statement#
=end

class CreateTableRxAnexa < Sequel::Migration

  def up
    create_table(:rx_anexa) do
      primary_key   :id
    end
  end

  def down
    drop_table(:rx_anexa)
  end

end
