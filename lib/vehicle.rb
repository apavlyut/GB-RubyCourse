class Vehicle
  attr_reader :name
  attr_reader :number_of_seats
  attr_reader :number_of_wheels
  attr_reader :motion
  attr_reader :broken

  def initialize(name, number_of_wheels, number_of_seats)
    @name = name
    @number_of_wheels = number_of_wheels
    @number_of_seats = number_of_seats
    @motion = false
    @broken = false
  end

  def get_vehicle_name
    "#{self.class.name} #{@name}"
  end

  def start!
    if @broken
      raise "#{get_vehicle_name} is broken and will not start!"
    end
    if @motion
      puts "#{get_vehicle_name} already started"
    else
      @motion = true
      puts "#{get_vehicle_name} started"
    end
  end

  def stop!
    if !@motion
      puts "#{get_vehicle_name} already stopped"
    else
      @motion = false
      puts "#{get_vehicle_name} stopped"
    end

  end

  def break!
    @broken = true
    @motion = false
    puts "#{get_vehicle_name} is broken!"
  end

  def inspect
    "#{get_vehicle_name}:[number_of_wheels=#{@number_of_wheels}, number_of_seats=#{@number_of_seats}, motion=#{@motion}, broken=#{@broken}]"
  end
end