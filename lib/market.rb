class Market
  attr_reader :name, :vendors
  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map {|vendor| vendor.name}
  end

  def vendors_that_sell(item)
    @vendors.find_all do |vendor|
      vendor.inventory.has_key?(item)
    end
  end

  def sorted_item_list
    list = @vendors.map {|vendor| vendor.inventory.keys}
    list.flatten!.uniq!.sort!
  end

  def total_inventory
    hash = Hash.new {|hash,key| hash[key] = 0}
    @vendors.each do |vendor|
      vendor.inventory.each do |item|
        hash[item.first] += item.last
      end
    end
    hash
  end
end
