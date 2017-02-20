require 'test/unit'

class AbstractTest < Test::Unit::TestCase

  def assert_vehicle(expected_name,
                     expected_number_of_wheels,
                     expected_number_of_seats,
                     expected_motion,
                     expected_broken,
                     vehicle)
    assert_equal(expected_name, vehicle.name)
    assert_equal(expected_number_of_wheels, vehicle.number_of_wheels)
    assert_equal(expected_number_of_seats, vehicle.number_of_seats)
    assert_equal(expected_motion, vehicle.motion)
    assert_equal(expected_broken, vehicle.broken)
  end

end