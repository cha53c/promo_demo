class User < ActiveRecord::Base
  belongs_to :client

  scope :unconfirmed, -> {where(confirmed_at: nil)}
  scope :nosignin, -> {where(sign_in_count: 0)}
  scope :locked, -> {where.not(locked_at: nil)}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :timeoutable, :lockable
  # TODO a default role will be set on registration - only and admin will be able to change it.
  ROLES = [['Admin', 'admin'], ['Client', 'client'],['Account Manager', 'acc_manager']]
  # TODO only admin will be able to change the role the default is 'client'
  validates_inclusion_of :role, within: %w(admin client acc_manager), message: "#{:role} is not a valid role"
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


