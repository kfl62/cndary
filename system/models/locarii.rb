#encoding: utf-8

module Cnd
  module Db
    # #Cnd Database Locatii model
    # ##Migration 014_create_table_locatii.rb
    # ##Loaded plugins
    # ##Associations
    # ##Validations
    class Locatii < Sequel::Model
      set_dataset :locatii

      class << self
      end # class methods

    end # Locatii
  end # Db
end # Cnd
