class User < ActiveRecord::Base
  BOUND_PRECISION = 6
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :calories_bound

  def calories_bound
    super || CaloriesBound.new(user_id: self.id, upper_bound: BigDecimal.new(2000.0, BOUND_PRECISION))
  end
end
