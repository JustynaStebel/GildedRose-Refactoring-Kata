class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      if item.name == "Sulfuras, Hand of Ragnaros"
        next
      end
      if item.name == "Aged Brie"
        item.quality += 1 if item.quality < 50
      elsif item.name == "Backstage passes to a TAFKAL80ETC concert"
        if item.sell_in < 0
          item.quality = 0
        else
          item.quality += 1 if item.quality < 50
          item.quality += 1 if item.sell_in < 11 && item.quality < 50
          item.quality += 1 if item.sell_in < 6 && item.quality < 50
        end
      elsif item.name == "Conjured"
        item.quality -= 2 if item.quality > 0
      else
        item.quality -= 1 if item.quality > 0
      end
    end
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
