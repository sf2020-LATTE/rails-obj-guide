class Bicycle
  attr_reader :size, :chain, :tire_size

  def initialize(args = {})
    @size = args[:size] # 自転車のサイズ
    @chain = args[:chain]
    @tire_size = args[:tire_size]
  end

  def spares
    {
      chain: chain,
      tire_size: tire_size,
    }
  end
end

class RoasBike < Bicycle
  attr_reader :tape_color

  def initialize(args)
    @tape_color = args[:tape_color] # ハンドルテープの色
    super(args) # 親クラスの同メソッド呼び出し
  end

  def spares
    # {
    #   chain: '10-speed',
    #   tire_size: '23',
    #   tape_color: tape_color
    # }
    super.merge(tape_color: tape_color)
  end
end

class MountainBike < Bicycle
  attr_reader :front_shock, :rear_shock

  def initialize(args)
    @front_shock = args[:front_shock] # 前のサスペンション(マウンテンバイク特有)
    @rear_shock = args[:rear_shock] # 後ろのサスペンション(マウンテンバイク特有)
    super(args) # 親クラスの同メソッド呼び出し
  end

  def spares
    # {
    #   chain: '10-speed',
    #   tire_size: '2.1',
    #   rear_shock: rear_shock
    # }
    super.merge(rear_shock: rear_shock)
  end
end
