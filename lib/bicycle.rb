require_relative 'vehicle'
class Bicycle < Vehicle
  def initialize(name)
    super(name, 2, 2)
  end
end