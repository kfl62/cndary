#encoding: utf-8
=begin
#Cnd Database Rx create statement#
=end

class CreateTableRx < Sequel::Migration

  def up
    create_table(:rx) do
      column :LocLab,     "int(10)",      null: false
      column :DataEfect,  "datetime"
      column :NR_BUL,     "double",       null: false
      column :Comanda,    "varchar(100)"
      column :DATA_BUL,   "datetime"
      column :BENEFIC,    "varchar(200)"
      column :NR_DESEN,   "varchar(100)"
      column :MATERIAL,   "varchar(100)"
      column :PRODUS,     "varchar(200)"
      column :SUBANS,     "varchar(200)"
      column :NR_FABR,    "varchar(100)"
      column :Sarja,      "varchar(100)"
      column :TRATAM,     "varchar(50)"
      column :INDICATIV,  "varchar(50)"
      column :GROSIME,    "varchar(50)"
      column :DIM_PATA,   "varchar(50)"
      column :TENSIUNE,   "double"
      column :INTENSIT,   "double"
      column :DISTFOC,    "double"
      column :EXP_MIN,    "double"
      column :EXP_SEC,    "double"
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
      column :StareSupraf,"varchar(100)"
      column :ProcApl,    "varchar(100)"
      column :Reper,      "varchar(100)"
      column :LocEfect,   "varchar(50)"
      column :WORD,       "longblob"

      primary_key [:LocLab, :NR_BUL]

      index [:NR_BUL], :name=>:NR_BUL
    end
  end

  def down
    drop_table(:rx)
  end

end
