require "./actor"
require "./enemy"

class Game

  @@level = 0

  def self.start
    case @@level
    when 0
      name = "スライム"
    when 1
      name = "ゴーレム"
    else
    end
    actor = Actor.new("主人公", 100, 30)
    enemy = Enemy.new(name, 100, 5)
    enemy.show
    while true
      puts "--------------"
      puts "コマンドを選択してください。"
      puts "--------------"
      puts "[1]: たたかう"
      puts "[2]: にげる"
      puts "--------------"
      input = gets.to_i
      case input
      when 1
        actor.attack(enemy)
        if actor.killed(enemy)
          actor.victory(enemy)
          @@level += 1
          if @@level == 2
            puts "ゲームクリア！おめでとう！"
            exit
          end
          self.continue
        end
        enemy.attack(actor)
        if enemy.killed(actor)
          actor.lose
          self.continue
        end

      when 2
        puts "にげました。"
        exit
      else
        puts "そんなコマンドねーよ"
      end
    end
  end

  def self.end
    puts "終了しました！"
    exit
  end

  def self.continue
    puts "もう一度プレイしますか？"
    puts "[1]: Yes"
    puts "[2]: No"
    input = gets.to_i
    if input == 1
      self.start
    elsif input == 2
      exit
    end
  end

end

while true
  puts "ゲームを開始しますか？"
  puts "[0]: start"
  puts "[1]: end"
  input = gets.to_i
  case input
  when 0
    Game.start
  when 1
    Game.end
  else
    puts "値が不正です！"
  end
end