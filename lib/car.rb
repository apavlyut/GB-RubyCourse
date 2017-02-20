require_relative 'vehicle'
class Car < Vehicle
  def initialize(name)
    super(name, 4, 4)
  end
end