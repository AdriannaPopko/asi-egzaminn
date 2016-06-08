class CaloriesBound < ActiveRecord::Base
  belongs_to :user

  validates :upper_bound, presence: true, numericality: { greater_than: 0, only_integer: true }
end
