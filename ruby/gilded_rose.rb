class GildedRose
  attr_accessor :items

  def initialize(items)
    @items = items
  end

  def update_quality
    items.each do |item|
      item.update_item
    end
  end
end
