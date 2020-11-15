class GenericItem < Item
  MINIMUM_QUALITY = 0
  MAXIMUM_QUALITY = 50
  DEGRADE_RATIO = -1

  def update_item
    update_quality
    @sell_in -= 1
  end

  private

  def update_quality
    @quality += degrade_amount
    actual_value
  end

  def degrade_amount
    self.class::DEGRADE_RATIO * (expired? ? 2 : 1)
  end

  def actual_value
    #updating quality with min actual value upto maximum quality
    @quality = [@quality, MAXIMUM_QUALITY].min
    #updating quality with max actual value upto minimum quality
    @quality = [@quality, MINIMUM_QUALITY].max
  end

  def expired?
    @sell_in < 1
  end
end
