class Player
  #Type is Codemaker or Codebreaker
  #Controller is Human or Computer
  attr_accessor(:playType, :playController, :points)


  def initialize (type, controller)
    @playType = type
    @playController = controller
    @points = 0

  end

  def getType
    return @playType
  end

  def getController
    return @playController
  end

  def getScore
    return @score
  end

  def score(newPoints)
    @points = @points + newPoints.to_i
  end

  def generateCode(colorOptions)
    code = []
    4.times do
      code.push(colorOptions.sample)
    end
    return code
  end

  def feedback(guess,code)
    result = []
    testguess = []
    testguess.replace(guess)
    testcode = []
    testcode.replace(code)
    i = 0
    testguess.each do |x|
      if x == testcode[i]
        result.push("B")
        testcode[i] = "X"
        testguess[i] = "Z"
      end
      puts "Code: " + testcode.to_s
      puts "Guess: " + testguess.to_s
      i = i + 1
    end
    i = 0
    testguess.each do |x|
      if testcode.include?(x)
        result.push("W")
        testcode[testcode.find_index {|e| e.match(testguess[i])}] = "X"
        testguess[i] = "Z"
      end
      i = i + 1
    end
    return result
  end


end
