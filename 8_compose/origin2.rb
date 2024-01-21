class Parts
  attr_reader :chain, :tire_size

  def initialize(args={})
    @chain = args[:chain] || default_chain
    @tire_size = args[:tire_size] || default_tire_size
    post_initialize(args)
  end

  def spares
    {
      tire_size: tire_size,
      chain: chain
  }.merge(local_spares)
  end

  def default_tire_size
    raise NotImprelnetedError
  end

  def post_initialize
    nil
  end

  def local_spares
    {}
  end

  def default_chain
    '10-speed'
  end
end

class Bicycle
  attr_reader :size, :parts

  def initialize(args={})
    @size = args[:size]   # Bicycleの責任１ sizeを知ること
    @parts = args[:parts] # Bicycleの責任2 partsを知ること
  end

  # Bicycleの責任3 sparesに応えること
  def spares
    parts.spares
  end
end


class RoadBikeParts < Parts
  attr_reader :tape_color

  def post_initialize(args)
    @tape_color = args[:tape_color]
  end

  def local_spares
    {tape_color: tape_color}
  end

  def default_tire_size
    '23'
  end
end


class MountainBikeParts < Parts
  attr_reader :front_shock, :rear_shock

  def post_initialize(args)
    @front_shock = args[:front_shock]
    @rear_shock = args[:rear_shock]
  end

  def local_spares
    {rear_shock: rear_shock}
  end

  def default_tire_size
    '2.1'
  end
end

road_bike = Bicycle.new(
  size: 'L',
  parts: RoadBikeParts.new(tape_color: 'red')
)

moutain_bike = Bicycle.new(
  size: 'L',
  parts: MountainBikeParts.new(rear_shock: 'Fox')
)

p road_bike.size

p road_bike.spares

p moutain_bike.size

p moutain_bike.spares
