require "./character"

class Enemy < Character

  def attack(target)
    if self.name == "スライム"
      self.power = rand(30)
    elsif self.name == "ゴーレム"
      self.power = rand(20..50)
    end
    super
  end

  def show
    puts "#{self.name}が現れた!"
  end


  
end