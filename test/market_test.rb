require 'minitest/autorun'
require 'minitest/pride'
require './lib/market'
require './lib/vendor'

class MarketTest < Minitest::Test
  def setup
    @market = Market.new("South Pearl Street Farmers Market")
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
end
