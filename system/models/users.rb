#encoding: utf-8

module Cnd
  module Db
    # #Cnd Database Users model
    # ##Migration 000_create_table_users.rb
    # ##Loaded plugins
    # ##Associations
    # ##Validations
    class Users < Sequel::Model
      attr_accessor :password, :password_confirmation

      set_dataset :users

      def before_save
        encrypt_password if password_required
        super
      end

      class << self
        # Authentication based on name and password
        # @param [String] login_name User name
        # @param [String] password User password
        # @return [User] returns nil if no user with `login_name`, or password
        #   doesn't match
        def authenticate(login_name, password)
          current_user = find(login_name: login_name) if login_name
          current_user && current_user.has_password?(password) ? current_user : nil
        end
      end # class methods

      # Verify `hashed_password`
      # @return [Boolean]
      def has_password?(password)
        ::BCrypt::Password.new(hashed_password) == password
      end
      # `true` if `#user` has admin rights
      # @return [Boolean]
      def root?
        self.id == 1
      end
      # `true` if `#user` has admin rights
      # @return [Boolean]
      def admin?
        self.id < 3
      end

      protected

      # Generate encrypted password
      # @return [String] random string for `#user.salt`
      def encrypt_password
        self.hashed_password = ::BCrypt::Password.create(self.password)
      end
      # @todo
      # Document this method
      def password_required
        hashed_password.nil? || self.password
      end
      # @return [Boolean] `false` just for safety :)
      def method_missing(m, *args)
        return false
      end
    end # Users
  end # Db
end # Cnd
