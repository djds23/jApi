module JAPI

  # Clue object with a question, answer and other details.
  #
  # @author Dean Silfen
    class Clue

    # @param options [Hash{String, Symbol => Fixnum, String, DateTime, Hash}]
    # @option options [Fixnum] :value amount in dollars of question
    # @option options [Fixnum] :id clue id
    # @option options [Fixnum] :category_id id of the clue's category
    # @option options [Fixnum] :game_id id of the game where the clue appeared
    # @option options [Hash] :category Hash containing Category info. see {JAPI::Category}
    # @option options [String] :question the question text
    # @option options [String] :answer the answer text
    def initialize(options = {})
      @options = options
    end

    # @return [Fixnum] amount in dollars of question
    def value
      @options["value"]
    end

    # @return [Fixnum] clue id
    def clue_id
      @options["id"]
    end

    # @return [Fixnum] category id
    def category_id
      @options["category_id"]
    end

    # @return [Category] category associated with this Clue
    def category
      Category.new(@options["category"])
    end

    # @return [Fixnum] id of the game this clue initially aired on
    def game_id
      @options["game_id"]
    end

    # @return [String] question text for this clue
    def question
      @options["question"]
    end

    # @return [String] answer text for this clue
    def answer
      @options["answer"]
    end
  end
end

