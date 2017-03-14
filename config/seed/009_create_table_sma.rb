#encoding: utf-8
=begin
#Cnd Database Sma create statement#
=end

class CreateTableSma < Sequel::Migration

  def up
    create_table(:sma) do
      column :SterseGamma,      "varchar(6)"
      column :ModificateGamma,  "varchar(6)"
      column :SterseAGamma,     "varchar(6)"
      column :ModificateAGamma, "varchar(6)"
      column :SterseUs,         "varchar(6)"
      column :ModificateUs,     "varchar(6)"
      column :SterseAUs,        "varchar(6)"
      column :ModificateAUs,    "varchar(6)"
      column :SterseRx,         "varchar(6)"
      column :ModificateRx,     "varchar(6)"
      column :SterseARx,        "varchar(6)"
      column :ModificateARx,    "varchar(6)"
      column :StersePm,         "varchar(6)"
      column :ModificatePm,     "varchar(6)"
      column :SterseApm,        "varchar(6)"
      column :ModificateApm,    "varchar(6)"
      column :SterseLp,         "varchar(6)"
      column :ModificateLp,     "varchar(6)"
      column :SterseALp,        "varchar(6)"
      column :ModificateALp,    "varchar(6)"
      column :SterseUsg,        "varchar(6)"
      column :ModificateUsg,    "varchar(6)"
      column :SterseAUsg,       "varchar(6)"
      column :ModificateAUsg,   "varchar(6)"

      primary_key :n, :type=>"int(10)"
    end
  end

  def down
    drop_table(:sma)
  end

end
