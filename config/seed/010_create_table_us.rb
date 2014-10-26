#encoding: utf-8
=begin
#Cnd Database Us create statement#
=end

class CreateTableUs < Sequel::Migration

  def up
    create_table(:us) do
      primary_key   :id
    end
  end

  def down
    drop_table(:us)
  end

end
