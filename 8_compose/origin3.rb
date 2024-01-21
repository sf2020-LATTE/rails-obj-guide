class Bicycle
  attr_reader :size, :parts

  def initialize(args={})
    @size = args[:size]
    @parts = args[:parts]
  end

  def spares
    parts.spares
  end
end

class Parts
  attr_reader :parts

  def initialize(parts)
    @parts = parts
  end

  def spares
    parts.select {|part| part.need_spare }
  end
end

class Part
  attr_reader :name, :description, :need_spare

  def initialize(args)
    @name = args[:name]
    @description = args[:description]
    @need_spare = args.fetch(:need_spare, true)
  end
end

chain = Part.new(name: 'chain', description: '10-speed')
road_tire = Part.new(name: 'tire_size', description: '23')
tape = Part.new(name: 'tape_color', description: 'red')
mountain_tire = Part.new(name: 'read_shock', description: '2.1')
rear_shock = Part.new(name: 'rear_shock', description: 'Fox')
front_shock = Part.new(name: 'front_shock', description: 'Manitou', need_spare: false)
# p chain
# p road_tire
# p tape
# p mountain_tire
# p rear_shock
# p front_shock

# # Partのインスタンス変数が配列に入っている
road_bike_parts = Parts.new([chain, road_tire, tape])
# p road_bike_parts

road_bike = Bicycle.new(size: 'L', parts: Parts.new([chain, road_tire, tape]))
p road_bike.size
p road_bike.spares
