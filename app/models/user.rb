class User < ActiveRecord::Base
  scope :unconfirmed, -> {where(confirmed_at: nil)}
  scope :nosignin, -> {where(sign_in_count: 0)}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :timeoutable, :lockable

  ROLES = [['Admin', 'admin'], ['Client', 'client'],['Account Manager', 'acc_manager']]
  attr_accessor :password
  # TODO will need to pass the role in on account_update
  # TODO only admin will be able to change the role the default is 'client'
  validates_inclusion_of :role, within: %w(admin client acc_manager), message: "#{:role} is not a valid role"
  # TODO limit min lenght of password
  validates_confirmation_of :password
  # TODO a default role will be set on registration - only and admin will be able to change it. so the
  validates_presence_of :password, on: :create
  # TODO check email validation should now be handled by devise
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_length_of :email, maximum: 50

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

end


