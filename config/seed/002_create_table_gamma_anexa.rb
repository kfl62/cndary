#encoding: utf-8
=begin
#Cnd Database GammeAnexa create statement#
=end

class CreateTableGammaAnexa < Sequel::Migration

  def up
    create_table(:gamma_anexa) do
      primary_key   :id
    end
  end

  def down
    drop_table(:gamma_anexa)
  end

end
