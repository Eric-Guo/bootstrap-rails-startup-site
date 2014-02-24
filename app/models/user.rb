class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :ldap_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def email_required?
    false
  end

 	before_save :get_ldap_email
  def get_ldap_email
      self.email = Devise::LDAP::Adapter.get_ldap_param(self.badge, "mail").try :first
  end
end
