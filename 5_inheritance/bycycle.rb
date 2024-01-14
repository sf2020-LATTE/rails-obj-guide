class Bicycle
  attr_reader :style, :size, :tape_color, :front_shock, :rear_shock

  def initialize(args)
    @style = args[:style] # 自転車の種類
    @size = args[:size] # 自転車のサイズ
    @tape_color = args[:tape_color] # ハンドルテープの色
    @front_shock = args[:front_shock] # 前のサスペンション(マウンテンバイク特有)
    @rear_shock = args[:rear_shock] # 後ろのサスペンション(マウンテンバイク特有)
  end

  # スペアとして用意するもの
  def spares
    if style == :road
      # ロードバイクの場合
      {
        chain: '10-speed',
        tire_size: '23',
        tape_color: tape_color
      }
    else
      # ロードバイク以外(マウンテンバイク)の場合
      {
        chain: '10-speed',
        tire_size: '2.1',
        rear_shock: rear_shock
      }
    end
  end
end

bike = Bicycle.new(
  style: :mountain,
  size: 'S',
  front_shock: 'Mountou',
  rear_shock: 'Fox'
)

bike.spares
