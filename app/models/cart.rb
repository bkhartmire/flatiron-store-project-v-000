class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def add_item(item_id)
    line_item = self.line_items.find{|li| li.item_id == item_id.to_i}
    if line_item
      line_item.quantity += 1
    else
      line_item = self.line_items.build(item_id: item_id, cart_id: self.id)
    end
    line_item
  end

  def total
    total = 0
    self.line_items.each do |line_item|
      total += (line_item.item.price * line_item.quantity)
    end
    total
  end
end
