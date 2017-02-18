#!/usr/bin/env ruby
class Vehicle

  def initialize(number_of_wheels, number_of_seats)
    @number_of_wheels = number_of_wheels
    @number_of_seats = number_of_seats
    @motion = true
    @broken = false
  end

  def start
    @motion = true
  end

  def stop
    @motion = false
  end

  def break
    @broken = true
  end

  def inspect
    "#{self.class.name}:[number_of_wheels=#{@number_of_wheels}, number_of_seats=#{@number_of_seats}, motion=#{@motion}, broken=#{@broken}]"
  end
end

class Car < Vehicle
  def initialize
    super(4, 4)
  end
end

class Bicycle < Vehicle
  def initialize
    super(2, 2)
  end
end

class Road

  def initialize(traffic_light)
    @vehicle_list = []
    @traffic_light = traffic_light
  end

  def add_new_vehicle(vehicle)
    @vehicle_list.push(vehicle)
    self.handle_traffic_light_color
  end

  def handle_traffic_light_color
    case @traffic_light.color
      when 'red'
        @vehicle_list.map { |vehicle| vehicle.stop }
      when 'green'
        @vehicle_list.map { |vehicle| vehicle.start }
      when 'yellow'
        puts 'Prepare for traffic light color switch'
      else
        puts 'Traffic light broken'
        @vehicle_list.map { |vehicle| vehicle.break }
    end
  end

  def inspect
    "#{@traffic_light.inspect}, VehicleList: #{@vehicle_list.inspect} "
  end
end

class TrafficLight
  attr_reader :color

  def initialize
    @color = 'red'
  end

  def change_color(color)
    @color = color.downcase
  end

  def inspect
    "TrafficLight: #{@color}"
  end
end

def getUserInput(message)
  puts(message)
  gets.chomp.upcase
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
          vehicle = Car.new
        when 'BICYCLE'
          vehicle = Bicycle.new
        else
          puts ('Wrong car type')
          next
      end
      road.add_new_vehicle(vehicle)
      puts ("New #{vehicle.class.name} added")
    when 'CHANGE_COLOR'
      color = getUserInput('Choose traffic light: RED, YELLOW or GREEN or try anything else')
      traffic_light.change_color(color)
      road.handle_traffic_light_color
    else
      puts('Wrong command, try again')
  end
  puts road.inspect
end