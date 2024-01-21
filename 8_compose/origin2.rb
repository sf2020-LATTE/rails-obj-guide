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

class RoasBikeParts < Parts
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


class MountainBike < Parts
  attr_reader :front_shock, :rear_shock
  def post_initialize
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

road_bike.size

road_bike.spares
