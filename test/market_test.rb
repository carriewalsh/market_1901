require 'minitest/autorun'
require 'minitest/pride'
require './lib/market'
require './lib/vendor'

class MarketTest < Minitest::Test
  def setup
    @market = Market.new("South Pearl Street Farmers Market")
    @vendor_1 = Vendor.new("Rocky Mountain Fresh")
    @vendor_1.stock("Peaches", 35)
    @vendor_1.stock("Tomatoes", 7)
    @vendor_2 = Vendor.new("Ba-Nom-a-Nom")
    @vendor_2.stock("Banana Nice Cream", 50)
    @vendor_2.stock("Peach-Raspberry Nice Cream", 25)
    @vendor_3 = Vendor.new("Palisade Peach Shack")
    @vendor_3.stock("Peaches", 65)
    @market.add_vendor(@vendor_1)
    @market.add_vendor(@vendor_2)
    @market.add_vendor(@vendor_3)
  end

  def test_market_exists
    assert_instance_of Market, @market
  end

  def test_market_has_name
    assert_equal "South Pearl Street Farmers Market", @market.name
  end

  def test_market_starts_with_no_vendors_by_default
    market = Market.new("7-11")
    assert_equal [], market.vendors
  end

  def test_market_can_have_vendors_added
    assert_equal [@vendor_1,@vendor_2,@vendor_3], @market.vendors
  end

  def test_market_can_list_of_vendor_names
    assert_equal ["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"], @market.vendor_names
  end
end
