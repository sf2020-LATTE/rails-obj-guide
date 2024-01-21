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

