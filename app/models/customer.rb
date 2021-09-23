class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  def active_for_authentication?
    super && (self.is_customer_status == true) #入会済みの人(is_customer_statusがtrue）の人ならログイン出来る
  end
  
end
