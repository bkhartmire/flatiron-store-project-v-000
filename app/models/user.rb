class User < ActiveRecord::Base
  has_many :carts
  belongs_to :current_cart, class_name: 'Cart', foreign_key: 'cart_id'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  def current_cart
    if !self.carts.none?
      if self.carts.last.status == "not submitted"
        self.carts.last
      elsif self.carts.last.status == "Submitted"
        nil
      end
    end
  end
end
