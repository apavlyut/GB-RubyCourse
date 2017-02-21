
class Road
  attr_reader :vehicle_list
  attr_reader :traffic_light


  def initialize(traffic_light)
    @vehicle_list = []
    @traffic_light = traffic_light
  end

  def add_new_vehicle(vehicle)
    @vehicle_list.push(vehicle)
  end

  def handle_traffic_light_color
    case @traffic_light.color
      when 'red'
        @vehicle_list.map { |vehicle|
          vehicle.stop!
        }
      when 'green'
        @vehicle_list.map { |vehicle|
          begin
            vehicle.start!
          rescue Exception => e
            puts "Exception: #{e.message}"
          end }
      when 'yellow'
        puts 'Prepare for traffic light color switch'
      else
        puts 'Traffic light broken'
        @vehicle_list.map { |vehicle| vehicle.break! }
    end
  end

  def inspect
    "#{@traffic_light.inspect}, VehicleList: #{@vehicle_list.inspect} "
  end

end