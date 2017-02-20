require 'test/unit'
require_relative '../lib/traffic_light'

class TrafficLightTest < Test::Unit::TestCase
  def test_traffic_light_constructor
    traffic_light = TrafficLight.new
    assert_equal('red',traffic_light.color)
  end

  def test_traffic_light_change_color
    traffic_light = TrafficLight.new
    traffic_light.change_color( 'green')
    assert_equal('green',traffic_light.color)
  end

  def test_traffic_light_change_color_to_downcase
    traffic_light = TrafficLight.new
    traffic_light.change_color( 'GREEN')
    assert_equal('green',traffic_light.color)
  end
end