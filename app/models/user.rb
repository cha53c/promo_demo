class User < ActiveRecord::Base

  ROLES = [['Admin', 'admin'], ['Client', 'client'],['Account Manager', 'acc_manager']]
  attr_accessor :password
  before_save :encrypt_password
  validates_inclusion_of :role, within: %w(admin client acc_manager), message: '#{:role} is not a valid role'
  # TODO limit min lenght of password
  validates_confirmation_of :password
  validates_presence_of :password, :role, on: :create
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_length_of :email, maximum: 50
  validates_format_of :email, with: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  #authorisation
  def admin?
    role == 'admin'
  end

  def client?
    role == 'client'
  end

  def account_manager?
    role == 'acc_manager'
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end


