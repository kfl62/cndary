#encoding: utf-8
=begin
#Cnd Database Lp create statement#
=end

class CreateTableLp < Sequel::Migration

  def up
    create_table(:lp) do
      column :LocLab,     "int(10)",      null: false
      column :DataEfect,  "datetime"
      column :NR_BUL,     "double",       null: false
      column :DATA_BUL,   "datetime"
      column :Comanda,    "varchar(100)"
      column :NR_FABR,    "varchar(100)"
      column :Sarja,      "varchar(100)"
      column :PRODUS,     "varchar(200)"
      column :SUBANS,     "varchar(200)"
      column :BENEFIC,    "varchar(200)"
      column :NR_DESEN,   "varchar(100)"
      column :TRATAM,     "varchar(100)"
      column :ProcApl,    "varchar(100)"
      column :DEG,        "varchar(100)"
      column :PEN,        "varchar(100)"
      column :DEV,        "varchar(100)"
      column :TEMP_MED,   "double"
      column :TEMP_PIES,  "double"
      column :MOD_CURAT,  "varchar(100)"
      column :T_PENETR,   "double"
      column :T_EMULS,    "double"
      column :T_DEVEL,    "double"
      column :MATERIAL,   "varchar(100)"
      column :MOD_INDEP,  "varchar(100)"
      column :TIP_LAMPA,  "varchar(50)"
      column :SuprafEx,   "varchar(100)"
      column :SensEt,     "varchar(50)"
      column :Etalon,     "varchar(50)"
      column :Procent,    "varchar(50)"
      column :PRESCRIP,   "varchar(100)"
      column :Obs,        "varchar(100)"
      column :TipIlum,    "varchar(50)"
      column :NUME_LAB,   "varchar(70)"
      column :IntLum,     "varchar(50)"
      column :Operator,   "varchar(70)"
      column :Expert,     "varchar(70)"
      column :MediuLucru, "varchar(50)"
      column :StareSupraf,"varchar(100)"
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
    drop_table(:lp)
  end

end
