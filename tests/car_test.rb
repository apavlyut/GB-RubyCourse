require_relative '../lib/car'
require_relative 'abstract_test'

class CarTest < AbstractTest

def test_car_constructor
  car = Car.new('TestCar')
  assert_vehicle('TestCar', 4,4,false, false, car)
end

end