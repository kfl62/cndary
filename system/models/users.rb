#encoding: utf-8

module Cnd
  module Db
    # #Cnd Database Users model
    # ##Migration 000_create_table_users.rb
    # ##Loaded plugins
    # ##Associations
    # ##Validations
    class Users < Sequel::Model
      set_dataset :users

      class << self
      end # class methods

    end # Users
  end # Db
end # Cnd
