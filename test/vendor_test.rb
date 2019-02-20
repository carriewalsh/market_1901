require 'minitest/autorun'
require 'minitest/pride'
require './lib/vendor'

class VendorTest < Minitest::Test
  def setup
    @vendor = Vendor.new("Rocky Mountain Fresh")
    @vendor.stock("Peaches",30)
  end

  def test_vendor_exists
    assert_instance_of Vendor, @vendor
  end

  def test_vendor_has_a_name
    assert_equal "Rocky Mountain Fresh",
    @vendor.name
  end

  def test_inventory_starts_as_empty_hash
    vendor = Vendor.new("Rocky Mountain Fresh")
    assert_equal ({}), vendor.inventory
  end

  def test_stocking_items_adds_to_inventory
    assert_equal 30, @vendor.inventory["Peaches"]
    @vendor.stock("Tomatoes",12)
    expected = {"Peaches" => 30,
                "Tomatoes" => 12}
    assert_equal expected, @vendor.inventory
  end

  def test_vendor_can_check_stock_of_item
    assert_equal 30, @vendor.check_stock("Peaches")

  end

end
