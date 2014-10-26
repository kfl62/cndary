# encoding: utf-8
module Cnd
  # ##Description
  # ##Scope
  # @todo documentation
  module Db
    DB = Sequel.mysql2('cnd',host: 'localhost',user: 'root',password: 'piroskakiss') unless defined?(DB)
    Sequel.extension :migration
  end
end
