#encoding: utf-8
=begin
#Cnd Database Locatii create statement#
=end

class CreateTableLocatii < Sequel::Migration

  def up
    create_table(:locatii) do
      column :Localitate, "varchar(50)"
      column :Sediu,      "varchar(50)"

      primary_key :LocLab, :type=>"int(10)"
    end
  end

  def down
    drop_table(:locatii)
  end

end
