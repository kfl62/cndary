#encoding: utf-8
=begin
#Cnd Database Pm create statement#
=end

class CreateTablePm < Sequel::Migration

  def up
    create_table(:pm) do
      column :LocLab,     "int(10)",      null: false
      column :DataEfect,  "datetime"
      column :NR_BUL,     "double",       null: false
      column :DATA_BUL,   "datetime"
      column :Comanda,    "varchar(100)"
      column :MATERIAL,   "varchar(100)"
      column :TRATAM,     "varchar(50)"
      column :NR_DESEN,   "varchar(100)"
      column :PRODUS,     "varchar(200)"
      column :NR_FABR,    "varchar(100)"
      column :Sarja,      "varchar(100)"
      column :BENEFIC,    "varchar(100)"
      column :SUBANS,     "varchar(200)"
      column :PROC_MAG,   "varchar(100)"
      column :PARAM_EL,   "varchar(50)"
      column :DIST,       "double"
      column :TIP_PUL,    "varchar(100)"
      column :CONCEN,     "double"
      column :FLUID,      "varchar(50)"
      column :T_AGIT,     "double"
      column :TIP_LAMPA,  "varchar(50)"
      column :IntLum,     "varchar(50)"
      column :ProcApl,    "varchar(100)"
      column :SuprafEx,   "varchar(100)"
      column :StareSupraf,"varchar(100)"
      column :PRESCRIP,   "varchar(100)"
      column :Obs,        "varchar(200)"
      column :TipIlum,    "varchar(50)"
      column :NUME_LAB,   "varchar(70)"
      column :Operator,   "varchar(70)"
      column :Expert,     "varchar(70)"
      column :Aparat,     "varchar(50)"
      column :MediuLucru, "varchar(50)"
      column :Agent,      "varchar(50)"
      column :Etalon,     "varchar(50)"
      column :Procent,    "varchar(50)"
      column :SensEt,     "varchar(50)"
      column :NivelRef,   "varchar(10)"
      column :NivelEval,  "varchar(10)"
      column :NivelAcc,   "varchar(10)"
      column :Result,     "varchar(20)"
      column :LocEfect,   "varchar(50)"
      column :WORD,       "longblob"

      primary_key [:LocLab, :NR_BUL]

      index [:NR_BUL], :name=>:NR_BUL
     end
  end

  def down
    drop_table(:pm)
  end

end
