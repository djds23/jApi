class Clue
  attr_accessor :image, :answerr
  
  def initialize(image: nil, answer: nil)
    @image = image
    @answer = answer
  end
end
