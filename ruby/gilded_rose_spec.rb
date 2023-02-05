require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].name).to eq "foo"
    end
    it "does change the quality for normal items by -1" do
      items = [Item.new("foo", 5, 30)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 29
    end
    it "does change the quality for aged brie items by +1" do
      items = [Item.new("Aged Brie", 5, 30)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 31
    end
    it "does change the quality for conjured items by -2" do
      items = [Item.new("Conjured", 5, 30)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 28
    end
    it "does change the quality for backstage passes items by +1 if sell_in > 10" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 30)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 31
    end
    it "does change the quality for backstage passes items by +2 if sell_in < 10" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 9, 30)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 32
    end
    it "does change the quality for backstage passes items by +3 if sell_in < 5" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 4, 30)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 33
    end
    it "does change the quality for backstage passes items to 0 if sell_in < 0" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", -1, 30)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 0
    end
    it "does not change the quality for Sulfuras items" do
      items = [Item.new("Sulfuras, Hand of Ragnaros", 5, 80)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 80
    end
  end

end
