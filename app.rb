#!/usr/bin/env ruby

require './lib/bicycle'
require './lib/car'
require './lib/road'
require './lib/traffic_light'
require './lib/vehicle'

def getUserInput(message)
  while (true) do
    puts(message)
    input = gets.strip!.chomp.upcase
    if !input.empty?
      return input
    end
    puts('You\'ve entered empty line, please retry')
  end
end


traffic_light = TrafficLight.new
road = Road.new(traffic_light)

while true
  command = getUserInput('Choose action: ADD_VEHICLE or CHANGE_COLOR')
  case command
    when 'ADD_VEHICLE'
      type = getUserInput('Choose vehicle type: CAR or BICYCLE')
      case type
        when 'CAR'
          name = getUserInput('Please enter name of car')
          vehicle = Car.new(name)
        when 'BICYCLE'
          name = getUserInput('Please enter name of bicycle')
          vehicle = Bicycle.new(name)
        else
          puts ('Wrong car type')
          next
      end
      road.add_new_vehicle(vehicle)
      puts ("New #{vehicle.class.name} added, by default is not moving")
    when 'CHANGE_COLOR'
      color = getUserInput('Choose traffic light: RED, YELLOW or GREEN or try anything else')
      traffic_light.change_color(color)
      road.handle_traffic_light_color
    else
      puts('Wrong command, try again')
  end
  puts road.inspect
end