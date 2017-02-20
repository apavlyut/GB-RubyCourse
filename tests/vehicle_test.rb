require_relative '../lib/vehicle'
require_relative 'abstract_test'

class VehicleTest < AbstractTest

  def test_vehicle_constructor
    vehicle = Vehicle.new('TestVehicle', 6, 7)
    assert_vehicle('TestVehicle', 6, 7, false, false, vehicle)
  end

  def test_vehicle_start
    vehicle = Vehicle.new('TestVehicle', 6, 7)
    vehicle.start!
    assert_vehicle('TestVehicle', 6, 7, true, false, vehicle)
  end

  def test_vehicle_stop
    vehicle = Vehicle.new('TestVehicle', 6, 7)
    vehicle.stop!
    assert_vehicle('TestVehicle', 6, 7, false, false, vehicle)
    vehicle.start!
    vehicle.stop!
    assert_vehicle('TestVehicle', 6, 7, false, false, vehicle)
  end

  def test_vehicle_break
    vehicle = Vehicle.new('TestVehicle', 6, 7)
    vehicle.break!
    assert_vehicle('TestVehicle', 6, 7, false, true, vehicle)

    assert_raise do
      vehicle.start!
    end
    assert_vehicle('TestVehicle', 6, 7, false, true, vehicle)
  end


end