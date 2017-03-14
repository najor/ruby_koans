class DiceSet
  attr_reader :values

  attr_reader :r

  def initialize
    @values = []
    @r = Random.new
  end

  def roll(int)
    @values = []
    int.times do
      @values << @r.rand(1..6)
    end
  end

end