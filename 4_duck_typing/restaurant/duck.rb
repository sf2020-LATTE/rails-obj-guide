class KitchenManager
  def initialize
    @chefs = {}
  end

  def prepare_dishes(course_name)
    chef = @chefs[course_name]
    chef.cook
  end

  # ※以下略
end

class ItalianChef
  def cook
    {
      'アンティパスト': make_ahijo,
      'メイン': make_pasta,
      'ドルチェ': make_gelato
    }
  end

  # ※以下略
end

class FrenchChef
  def cook
    {
      'オードブル': make_terrine,
      'ヴィヤンド': make_rossini_steak,
      'デセール': make_millefeuille
    }
  end

  # ※以下略
end

class JapaneseChef
  def cook
    {
      '先付': make_goma_dofu,
      '焼物': make_saikyoyaki,
      '菓子': make_mizu_yokan
    }
  end

  # ※以下略
end

donald= KitchenManager.new
taro = JapaneseChef.new
alonzo = ItalianChef.new
alice = FrenchChef.new

donald.prepare_dishes(ItalianChef.new)
