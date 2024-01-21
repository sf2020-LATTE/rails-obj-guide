class Bicycle
  attr_reader :size, :parts

  def initialize(args = {})
    @size = args[:size] # 自転車のサイズ
    @parts = args[:parts] # 自転車の部品
  end

  def spares
    parts.spares
  end
end

# Partの集合
class Parts
  attr_reader :parts

  def initialize(parts)
    @parts = parts
  end

  def spares
    parts.select { |part| part.need_spare }
  end
end

class Part
  attr_reader :name, :description, :need_spare

  def initialize(args)
    @name = args[:name]
    @description = args[:description] # 部品の詳細情報
    @need_spare = args.fetch(:need_spare, true) # スペアを用意する必要があるか
  end
end
