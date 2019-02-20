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

  def sell(item,quantity)
    if vendors_that_sell(item).count > 0
      while quantity > 0
        vendors_that_sell(item).each do |vendor|
          if vendor.inventory[item] >= quantity
            vendor.inventory[item] -= quantity
            quantity = 0
            return true
          else
            quantity -= vendor.inventory[item]
            vendor.inventory[item] = 0
          end
        end
      end
    else
      return false
    end
  end
end
