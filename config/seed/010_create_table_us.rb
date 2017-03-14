#encoding: utf-8
=begin
#Cnd Database Us create statement#
=end

class CreateTableUs < Sequel::Migration

  def up
    create_table(:us) do
      column :LocLab,     "int(10)",      null: false
      column :DataEfect,  "datetime"
      column :NR_BUL,     "double",       null: false
      column :MATERIAL,   "varchar(100)"
      column :TRATAM,     "varchar(50)"
      column :Comanda,    "varchar(100)"
      column :DATA_BUL,   "datetime"
      column :NR_DESEN,   "varchar(100)"
      column :PRODUS,     "varchar(200)"
      column :NR_FABR,    "varchar(100)"
      column :Sarja,      "varchar(100)"
      column :SUBANS,     "varchar(200)"
      column :BENEFIC,    "varchar(200)"
      column :BlocEtalon1,"varchar(20)"
      column :BlocEtalon2,"varchar(20)"
      column :TipAp,      "varchar(50)"
      column :DOMENIU1,   "varchar(20)"
      column :Domeniu2,   "varchar(20)"
      column :AMPLIFIC1,  "varchar(10)"
      column :Amplific2,  "varchar(10)"
      column :VITEZA1,    "varchar(50)"
      column :Viteza2,    "varchar(50)"
      column :TIP_PALP1,  "varchar(20)"
      column :TipPalp2,   "varchar(20)"
      column :FRECV1,     "varchar(10)"
      column :Frecv2,     "varchar(10)"
      column :CUPLANT,    "varchar(50)"
      column :PROCENT1,   "varchar(20)"
      column :Procent2,   "varchar(20)"
      column :SuprafEx,   "varchar(50)"
      column :PRESCRIP,   "varchar(100)"
      column :Obs,        "varchar(200)"
      column :TipSud,     "varchar(50)"
      column :ProcApl,    "varchar(100)"
      column :NUME_LAB,   "varchar(70)"
      column :Operator,   "varchar(70)"
      column :Expert,     "varchar(70)"
      column :Angle1,     "varchar(10)"
      column :Angle2,     "varchar(10)"
      column :BlocCalib1, "varchar(20)"
      column :BlocCalib2, "varchar(20)"
      column :ReflectRef1,"varchar(20)"
      column :ReflectRef2,"varchar(20)"
      column :EchoRef1,   "varchar(20)"
      column :EchoRef2,   "varchar(20)"
      column :NivelRef,   "varchar(10)"
      column :NivelEval,  "varchar(10)"
      column :NivelAcc,   "varchar(10)"
      column :Result,     "varchar(20)"
      column :LocEfect,   "varchar(50)"
      column :StareSupraf,"varchar(100)"
      column :DimPalp1,   "varchar(10)"
      column :DimPalp2,   "varchar(10)"
      column :WORD,       "longblob"

      primary_key [:LocLab, :NR_BUL]

      index [:NR_BUL, :DATA_BUL], :name=>:NRDAT
      index [:NR_BUL], :name=>:NR_BUL
    end
  end

  def down
    drop_table(:us)
  end

end
