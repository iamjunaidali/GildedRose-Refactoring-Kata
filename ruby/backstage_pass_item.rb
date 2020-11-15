class BackstagePassItem < GenericItem
  def update_item
    super
    @quality = 0 if expired?
  end

  def degrade_amount
    return 3 if @sell_in.between?(1, 4)
    return 2 if @sell_in.between?(5, 9)
    return 1
  end
end
