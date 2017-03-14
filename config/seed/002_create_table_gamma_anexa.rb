#encoding: utf-8
=begin
#Cnd Database GammeAnexa create statement#
=end

class CreateTableGammaAnexa < Sequel::Migration

  def up
    create_table(:gamma_anexa) do
      column :LocLab,     "int(10)",      null: false
      column :NR_BUL,     "double",       null: false
      column :DATA_BUL,   "datetime",     null: false
      column :NR_RIND,    "double",       null: false
      column :ZONA_DN,    "varchar(100)"
      column :INDICAT_R,  "varchar(100)"
      column :SENSIBIL,   "varchar(50)"
      column :DIMENS_R,   "varchar(50)"
      column :TIP_DEFECT, "varchar(50)"
      column :REZULTAT,   "varchar(50)"
      column :Nivel,      "varchar(50)"

      primary_key [:LocLab, :NR_BUL, :DATA_BUL, :NR_RIND]

      index [:LocLab, :NR_BUL], :name=>:GAMMAANEXA_GA
      index [:NR_BUL, :NR_RIND], :name=>:nr_bul
    end
  end

  def down
    drop_table(:gamma_anexa)
  end

end
