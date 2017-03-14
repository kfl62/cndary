#encoding: utf-8
=begin
#Cnd Database Usg create statement#
=end

class CreateTableUsg < Sequel::Migration

  def up
    create_table(:usg) do
      column :LocLab,     "int(10)", :null=>false
      column :DataEfect,  "datetime"
      column :NR_BUL,     "double", :null=>false
      column :MATERIAL,   "varchar(100)"
      column :TRATAM,     "varchar(50)"
      column :Comanda,    "varchar(200)"
      column :DATA_BUL,   "datetime"
      column :NR_DESEN,   "varchar(100)"
      column :PRODUS,     "varchar(200)"
      column :NR_FABR,    "varchar(100)"
      column :Sarja,      "varchar(100)"
      column :SUBANS,     "varchar(200)"
      column :BENEFIC,    "varchar(200)"
      column :BlocEtalon, "varchar(50)"
      column :TIP_AP,     "varchar(50)"
      column :DOMENIU,    "double"
      column :AMPLIFIC,   "double"
      column :VITEZA,     "varchar(50)"
      column :DimPalp,    "varchar(20)"
      column :TIP_PALP,   "varchar(20)"
      column :FRECV,      "double"
      column :CUPLANT,    "varchar(50)"
      column :CITIRE,     "varchar(50)"
      column :SuprafEx,   "varchar(100)"
      column :PRESCRIP,   "varchar(100)"
      column :Obs,        "varchar(200)"
      column :StareSupraf,"varchar(200)"
      column :ProcApl,    "varchar(100)"
      column :NUME_LAB,   "varchar(70)"
      column :Operator,   "varchar(70)"
      column :Expert,     "varchar(70)"
      column :LocEfect,   "varchar(50)"
      column :NivelRef,   "varchar(10)"
      column :NivelEval,  "varchar(10)"
      column :NivelAcc,   "varchar(10)"
      column :Result,     "varchar(20)"
      column :WORD,       "longblob"

      primary_key [:LocLab, :NR_BUL]

      index [:NR_BUL, :DATA_BUL], :name=>:NRDAT
      index [:NR_BUL], :name=>:NR_BUL
    end
  end

  def down
    drop_table(:usg)
  end

end
