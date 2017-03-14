#encoding: utf-8
=begin
#Cnd Database Gammes create statement#
=end

class CreateTableGamma < Sequel::Migration

  def up
    create_table(:gamma) do
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
      column :INDICATIV,  "varchar(100)"
      column :GROSIME,    "varchar(50)"
      column :DIM_PATA,   "varchar(50)"
      column :ACTIVIT,    "double"
      column :DISTFOC,    "int(10)"
      column :EXP_MIN,    "int(10)"
      column :EXP_SEC,    "int(10)"
      column :TIPFILM,    "varchar(20)"
      column :TehnEx,     "varchar(50)"
      column :GROS_F,     "double"
      column :GROS_S,     "double"
      column :IND_CAL,    "varchar(50)"
      column :PROCENT,    "varchar(50)"
      column :Obs,        "varchar(100)"
      column :PRESCRIP,   "varchar(100)"
      column :NUME_LAB,   "varchar(70)"
      column :Operator,   "varchar(70)"
      column :Expert,     "varchar(70)"
      column :MATERIAL,   "varchar(100)"
      column :NR_DESEN,   "varchar(100)"
      column :TRATAM,     "varchar(50)"
      column :StareSupraf,"varchar(100)"
      column :ProcApl,    "varchar(100)"
      column :Reper,      "varchar(100)"
      column :LocEfect,   "varchar(50)"
      column :WORD,       "longblob"

      primary_key [:LocLab, :NR_BUL]

      index [:NR_BUL], :name=>:GAMMANR_BUL
    end
  end

  def down
    drop_table(:gamma)
  end

end
