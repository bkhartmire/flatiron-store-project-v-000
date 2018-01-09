class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def add_item(item)
    self.line_items.create(cart_id: self.id, item_id: item.id)
  end
end
