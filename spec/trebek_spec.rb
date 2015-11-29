require 'spec_helper'

describe JAPI::Trebek do
  let(:example_response) { '[{"id":107165,"answer":"a bishop","question":"...of chess pieces","value":200,"airdate":"2010-11-03T12:00:00.000Z","created_at":"2014-02-14T02:13:56.847Z","updated_at":"2014-02-14T02:13:56.847Z","category_id":300,"game_id":null,"invalid_count":null,"category":{"id":300,"title":"alphabetically first","created_at":"2014-02-11T22:48:12.011Z","updated_at":"2014-02-11T22:48:12.011Z","clues_count":20}}]' }
  before do
    allow(described_class).to receive_message_chain(
      :open, :read
    ).and_return(
      example_response
    )
  end

  describe '#random' do
    it 'properly creates a random clue' do
      expect(described_class.random.first).to be_a(JAPI::Clue)
    end
  end

  describe '#clues' do
    it 'raises an error if passed an invalid param' do
      expect{described_class.clues(not: 'valid')}.to raise_error(JAPI::InvalidParamError)
    end

    it 'accepts params and returns a clue array' do
      expect(described_class.clues(value: 100).first).to be_a(JAPI::Clue)
    end
  end
end

