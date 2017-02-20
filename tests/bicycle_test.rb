require_relative '../lib/bicycle'
require_relative 'abstract_test'

class BicycleTest < AbstractTest
  def test_bicycle_constructor
    bicycle = Bicycle.new('TestBicycle')
    assert_vehicle('TestBicycle', 2, 2, false, false, bicycle)
  end
end