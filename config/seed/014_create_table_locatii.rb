#encoding: utf-8
=begin
#Cnd Database Locatii create statement#
=end

class CreateTableLocatii < Sequel::Migration

  def up
    create_table(:locatii) do
      primary_key   :id
    end
  end

  def down
    drop_table(:locatii)
  end

end
