class Vendor
  attr_reader :name,
              :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def stock(name,quantity)
    @inventory[name] = quantity
  end

  def check_stock(item)
    @inventory[item]
  end
end
