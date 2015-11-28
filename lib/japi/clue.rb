class Clue

  def initialize(options = {})
    @options = options
  end

  def value
    @options["value"]
  end

  def clue_id
    @options["id"]
  end

  def category_id
    @options["category_id"]
  end

  def game_id
    @options["game_id"]
  end

  def question
    @options["question"]
  end

  def answer
    @options["answer"]
  end
end

