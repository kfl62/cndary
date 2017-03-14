#encoding: utf-8
=begin
#Cnd Database PmAnexa create statement#
=end

class CreateTablePmAnexa < Sequel::Migration

  def up
    create_table(:pm_anexa) do
      column :LocLab,     "int(10)",      null: false
      column :NR_BUL,     "double",       null: false
      column :DATA_BUL,   "datetime",     null: false
      column :NR_RIND,    "int(10)",      null: false
      column :Sectiune,   "varchar(100)"
      column :DistRef,    "varchar(100)"
      column :LungDisc,   "varchar(100)"
      column :LocDisc,    "varchar(50)"
      column :Acc,        "varchar(50)"
      column :REZULTAT,   "varchar(50)"
      column :Remaniere,  "varchar(50)"

      primary_key [:LocLab, :NR_BUL, :DATA_BUL, :NR_RIND]

      index [:LocLab, :NR_BUL], :name=>:PMAnexa_PM
      index [:NR_BUL, :NR_RIND], :name=>:nr_bul
    end
  end

  def down
    drop_table(:pm_anexa)
  end

end
