#!/usr/bin/env ruby
require 'drawille' # ты поставила гемы и нужно было зависимости добавить в Gemfile потому как они у меня не установлены.
require 'chunky_png'
include ChunkyPNG

require './lib/bicycle'
require './lib/car'
require './lib/road'
require './lib/traffic_light'
require './lib/vehicle'


def getUserInput(message)
  while (true) do # (true) скобки не обязательны. Когда мало агрументов для аккуратности опускай их
    puts(message)
    input = gets.strip!.chomp.upcase
    if !input.empty?
      return input
    end
    puts('You\'ve entered empty line, please retry')
  end
end

def draw(canvas, img, xoffset=0)
  (0..img.dimension.width-1).each do |x|
    (0..img.dimension.height-1).each do |y|
      r = Color.r(img[x, y])
      g = Color.g(img[x, y])
      b = Color.b(img[x, y])
      canvas.set(x+xoffset, y) if (r + b + g) > 100
    end
  end
end

def draw_file(pic_name)
  canvas = Drawille::Canvas.new
  draw canvas, Image.from_file("./img/#{pic_name}")
  puts canvas.frame
end

traffic_light = TrafficLight.new
road = Road.new(traffic_light)
puts 'Traffic Light is created'
draw_file('traffic-light.png')

while true
  command = getUserInput('Choose action: ADD_VEHICLE or CHANGE_COLOR')
  case command
    when 'ADD_VEHICLE'
      type = getUserInput('Choose vehicle type: CAR or BICYCLE')
      case type
        when 'CAR'
          name = getUserInput('Please enter name of car')
          vehicle = Car.new(name)
          draw_file('car.png')
        when 'BICYCLE'
          name = getUserInput('Please enter name of bicycle')
          vehicle = Bicycle.new(name)
          draw_file('man-cycling.png')
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
