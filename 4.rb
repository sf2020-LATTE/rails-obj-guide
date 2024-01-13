class ShibaInu
  def bark
    puts 'bow wow!'
  end

  def paw #　お手
    puts ('(pon)')
  end

  # ...(※以下略)
end

class SiberianHusky
  def bark
    puts 'howl!'
  end

  def paw
    puts '(pohu)'
  end

  # ...(※以下略)
end

taro = ShibaInu.new
jiro = SiberianHusky.new

taro.bark
taro.paw

jiro.bark
jiro.paw
