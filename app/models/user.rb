class User < ActiveRecord::Base
  # extends ....................................................................
  # includes ...................................................................
  # constants ..................................................................
  # associations ...............................................................
  # scopes .....................................................................
  # validations ................................................................

  validates :username,
            :presence => true,
            :length => { :maximum => 255 },
            :uniqueness => {
              :case_sensitive => false
            }

  # callbacks ..................................................................
  # additional config ..........................................................

  attr_accessor :login

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  rolify

  # class methods ..............................................................

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup

    if login = conditions.delete(:login)
      where(conditions). \
      where(arel_table[:username].lower.eq(login.downcase).or(
            arel_table[:email].lower.eq(login.downcase))).first
    else
      where(conditions).first
    end
  end

  # instance methods ...........................................................
  # protected instance methods .................................................
  # private instance methods ...................................................
end
