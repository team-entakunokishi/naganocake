class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
          has_many :orders, dependent: :destroy
          has_many :cart_items, dependent: :destroy

  has_many :addresses, dependent: :destroy
  
  validates :front_name, presence: true
  validates :back_name, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :post_code, presence: true
  validates :tel_number, presence: true
  validates :email, presence: true

  def active_for_authentication?
    super && (self.is_customer_status == true)
  end

end
