require 'spec_helper'

describe JAPI::Trebek do

  describe '#random' do
    before do
      allow(described_class).to receive_message_chain(
        :open, :read
      ).and_return(
        clue_resp
      )
    end

    it 'properly creates a random clue' do
      expect(described_class.random.first).to be_a(JAPI::Clue)
    end
  end

  describe '#clues' do
    before do
      allow(described_class).to receive_message_chain(
        :open, :read
      ).and_return(
        clue_resp
      )
    end

    it 'raises an error if passed an invalid param' do
      expect{described_class.clues(not: 'valid')}.to raise_error(JAPI::InvalidParamError)
    end

    it 'accepts params and returns a clue array' do
      expect(described_class.clues(value: 100).first).to be_a(JAPI::Clue)
    end
  end

  describe '#categories' do
    before do
      allow(described_class).to receive_message_chain(
        :open, :read
      ).and_return(
        categories_resp
      )
    end

    it 'raises an error if passed an invalid param' do
      expect{described_class.categories(not: 'valid')}.to raise_error(JAPI::InvalidParamError)
    end

    it 'returns an array of JAPI::Category' do
      categories = described_class.categories(count: 3)
      expect(categories).to be_a(Array)
      expect(categories.first).to be_a(JAPI::Category)
      expect(categories.first.title).to eq 'classic lit'
    end
  end

  describe '#category' do
    before do
      allow(described_class).to receive_message_chain(
        :open, :read
      ).and_return(
        category_resp
      )
    end

    it 'returns a category' do
      expect(described_class.category(8056)).to be_a(JAPI::Category)
      expect(described_class.category(8056).category_id).to eq 8056
    end
  end

  describe '#base_url' do
    it 'changes with configuration' do
      expect(described_class.send(:base_url)).to eq("http://jservice.io/api/")

      JAPI.configure do |config|
        config.jservice_url = "http://jeopardean.com/api/"
      end

      expect(described_class.send(:base_url)).to eq("http://jeopardean.com/api/")
    end
  end
end

