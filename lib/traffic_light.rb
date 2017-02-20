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