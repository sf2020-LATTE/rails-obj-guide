class FloorStaff
  def recieve_order(cource_menu)
    if cource_menu.empty?
      puts 'ただいま準備中です'
      return
    end

    puts 'いらっしゃいませ。メニューからコースをお選びください'
    order = nil
    loop do
      cource_menu.each { |course| puts "・#{course}" }
      order = gets.chomp.capitalize
      break if cource_menu.include?(order)

      puts '申し訳ありませんが、そちらはメニューにございません。再度お選びください'
    end

    puts 'かしこまりました。少々お待ちください'
    order
  end

  def serve_dishes(dishes)
    puts 'お待たせいたしました。こちらから'
    dishes.each do |course_order, dish|
      puts "・#{course_order}: #{dish}"
    end
    puts 'になります'
  end
end

class KitchenManager
  def initialize
    @chefs = {}
  end

  # KitchenManagerは、各シェフクラスのメニューの中身まで知ってしまっている（=依存している）
  def prepare_dishes(course_name)
    chef = @chefs[course_name]
    course_dishes = {}

    case chef
    when ItalianChef
      course_dishes['アンティパスト'] = chef.make_ahijo
      course_dishes['メイン'] = chef.make_pasta
      course_dishes['ドルチェ'] = chef.make_gelato
    when FrenchChef
      course_dishes['オードブル'] = chef.make_terrine
      course_dishes['ヴィヤンド'] = chef.make_rossini_steak
      course_dishes['デセール'] = chef.make_millefeuille
    when JapaneseChef
      course_dishes['先付'] = chef.make_goma_dofu
      course_dishes['焼物'] = chef.make_saikyoyaki
      course_dishes['菓子'] = chef.make_mizu_yokan
    end

    course_dishes
  end

  def employee_chef(chef_part, cook)
    @chefs[chef_part] = cook
  end

  def open_menu
    @chefs.keys
  end
end

class ItalianChef
  def make_pasta
    'トマトとベーコンのパスタ'
  end

  def make_ahijo
    'マッシュルームのアヒージョ'
  end

  def make_gelato
    'イチジクのジェラート'
  end
end

class FrenchChef
  def make_terrine
    '夏野菜のテリーヌ'
  end

  def make_rossini_steak
    '牛ヒレ肉のロッシーニ風'
  end

  def make_millefeuille
    '桃のミルフィーユ'
  end
end

class JapaneseChef
  def make_goma_dofu
    '胡麻豆腐'
  end

  def make_saikyoyaki
    '鰆の西京焼き'
  end

  def make_mizu_yokan
    '水羊羹'
  end
end

donald= KitchenManager.new
taro = JapaneseChef.new
alonzo = ItalianChef.new
alice = FrenchChef.new
takeo = FloorStaff.new

donald.employee_chef('Japanese', taro)
donald.employee_chef('Italian', alonzo)
donald.employee_chef('French', alice)

available_menu = donald.open_menu
customer_order = takeo.recieve_order(available_menu)
cource_dishes = donald.prepare_dishes(customer_order)
takeo.serve_dishes(cource_dishes)
