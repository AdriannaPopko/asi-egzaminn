class StandardCaloriesBound
  BOUND_PRECISION = 5

  attr_reader :user_id
  attr_writer :upper_bound

  def initialize(user_id)
    @user_id = user_id
  end 

  def upper_bound
    BigDecimal.new(2000.0, BOUND_PRECISION)
  end

  def created_at
    nil
  end

  def updated_at
    nil
  end

  def save!
    CaloriesBound.new do |bound|
      bound.user_id = user_id
      bound.upper_bound = upper_bound
    end.save!
  end
end
