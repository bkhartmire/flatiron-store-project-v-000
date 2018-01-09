class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def add_item(item)
    line_item = self.line_items.build
    line_item.item = item
  end

  def total
    self.items.price.sum
  end
end
