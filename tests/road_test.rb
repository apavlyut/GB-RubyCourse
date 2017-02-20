require_relative '../lib/road'
require_relative '../lib/traffic_light'
require_relative'../lib/car'
require_relative'../lib/bicycle'
require_relative 'abstract_test'

class RoadTest < AbstractTest

  def test_road_constructor
    road = Road.new(TrafficLight.new)
    assert_empty(road.vehicle_list)
    assert_not_nil(road.traffic_light)
  end

  def test_road_add_new_vehicle_red
    traffic_light = TrafficLight.new
    traffic_light.change_color('red')

    road = Road.new(traffic_light)
    road.add_new_vehicle(Car.new('TestCar'))

    assert_equal(1,road.vehicle_list.size)
    assert_vehicle('TestCar',4,4,false,false,road.vehicle_list[0])

    road.add_new_vehicle(Bicycle.new('TestBike'))
    assert_equal(2,road.vehicle_list.size)
    assert_vehicle('TestBike',2,2,false,false,road.vehicle_list[1])
  end

  def test_road_add_new_vehicle_green
    traffic_light = TrafficLight.new
    traffic_light.change_color( 'green')

    road = Road.new(traffic_light)
    road.add_new_vehicle(Car.new('TestCar'))

    assert_equal(1,road.vehicle_list.size)
    assert_vehicle('TestCar',4,4,true,false,road.vehicle_list[0])

    road.add_new_vehicle(Bicycle.new('TestBike'))
    assert_equal(2,road.vehicle_list.size)
    assert_vehicle('TestBike',2,2,false,false,road.vehicle_list[1])
  end

  def test_handle_traffic_light_color_red
    traffic_light = TrafficLight.new
    road = Road.new(traffic_light)
    road.add_new_vehicle(Car.new('TestCar1'))
    road.add_new_vehicle(Car.new('TestCar2'))
    road.add_new_vehicle(Car.new('TestCar3'))

    traffic_light.change_color( 'red')
    road.handle_traffic_light_color

    assert_vehicle('TestCar1',4,4,false,false,road.vehicle_list[0])
    assert_vehicle('TestCar2',4,4,false,false,road.vehicle_list[1])
    assert_vehicle('TestCar3',4,4,false,false,road.vehicle_list[2])
  end

  def test_handle_traffic_light_color_green
    traffic_light = TrafficLight.new
    road = Road.new(traffic_light)
    road.add_new_vehicle(Car.new('TestCar1'))
    road.add_new_vehicle(Car.new('TestCar2'))
    road.add_new_vehicle(Car.new('TestCar3'))

    traffic_light.change_color( 'green')
    road.handle_traffic_light_color

    assert_vehicle('TestCar1',4,4,true,false,road.vehicle_list[0])
    assert_vehicle('TestCar2',4,4,true,false,road.vehicle_list[1])
    assert_vehicle('TestCar3',4,4,true,false,road.vehicle_list[2])
  end

  def test_handle_traffic_light_color_yellow_after_red
    traffic_light = TrafficLight.new
    road = Road.new(traffic_light)
    road.add_new_vehicle(Car.new('TestCar1'))
    road.add_new_vehicle(Car.new('TestCar2'))
    road.add_new_vehicle(Car.new('TestCar3'))

    traffic_light.change_color( 'red')
    road.handle_traffic_light_color
    traffic_light.change_color( 'yellow')
    road.handle_traffic_light_color

    assert_vehicle('TestCar1',4,4,false,false,road.vehicle_list[0])
    assert_vehicle('TestCar2',4,4,false,false,road.vehicle_list[1])
    assert_vehicle('TestCar3',4,4,false,false,road.vehicle_list[2])
  end

  def test_handle_traffic_light_color_yellow_after_green
    traffic_light = TrafficLight.new
    road = Road.new(traffic_light)
    road.add_new_vehicle(Car.new('TestCar1'))
    road.add_new_vehicle(Car.new('TestCar2'))
    road.add_new_vehicle(Car.new('TestCar3'))

    traffic_light.change_color( 'green')
    road.handle_traffic_light_color
    traffic_light.change_color( 'yellow')
    road.handle_traffic_light_color

    assert_vehicle('TestCar1',4,4,true,false,road.vehicle_list[0])
    assert_vehicle('TestCar2',4,4,true,false,road.vehicle_list[1])
    assert_vehicle('TestCar3',4,4,true,false,road.vehicle_list[2])
  end

  def test_traffic_light_broken
    traffic_light = TrafficLight.new
    road = Road.new(traffic_light)
    road.add_new_vehicle(Car.new('TestCar1'))
    road.add_new_vehicle(Car.new('TestCar2'))
    road.add_new_vehicle(Car.new('TestCar3'))

    traffic_light.change_color( 'pink')
    road.handle_traffic_light_color

    assert_vehicle('TestCar1',4,4,false,true,road.vehicle_list[0])
    assert_vehicle('TestCar2',4,4,false,true,road.vehicle_list[1])
    assert_vehicle('TestCar3',4,4,false,true,road.vehicle_list[2])
  end

end