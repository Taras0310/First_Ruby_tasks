=begin
Create class Vehicle
Vehicle has year model owner and manufacturer
Class should have the following attributes
- attr accessor owner
- attr reader: year, model, manufacturer
- class attribute: count of wheels which is accessible to all class instance

Create three instances of Vehicle class:
-Audi A3, 1979, owmer - Antonio
- Moskvych 412, 988, not owner at the moment of Vehicle creation. After set owner as Vlad
- Skoda Fabia 1990, owner - Tony
=end
class Vehicle
  attr_accessor :owner
  attr_reader :year, :model
  @@count_wheels = 4
  def initialize(year, model, owner = nil)
    @year = year
    @model = model
    @owner = owner
  end

  def self.count_wheels
    @@count_wheels
  end

  def count_wheels
    self.class.count_wheels
  end
end

instance_1 = Vehicle.new('Audi A3', 1979, 'Antonio')

instance_2 = Vehicle.new('Moskvych 412', 988)
instance_2.owner = 'Vlad'

instance_3 = Vehicle.new('Skoda Fabia', 1990, 'Tony')

