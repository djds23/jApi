require 'json'
require 'spec_helper'

describe JAPI::Clue do
  let(:resp) { JSON.parse(clue_resp)[0] }

  it 'can initialize' do
    expect(described_class.new(resp)).not_to be nil
  end

  it 'responds to expected methods' do
    clue = described_class.new(resp)
    expect(clue.value).to eq 200
    expect(clue.game_id).to be_nil
    expect(clue.clue_id).to eq 107165
    expect(clue.answer).to eq "a bishop"
    expect(clue.question).to eq "...of chess pieces"
    expect(clue.airdate).to eq Time.parse("2010-11-03T12:00:00.000Z")
  end

  it 'returns a category for its category' do
    clue = described_class.new(resp)
    expect(clue.category).to be_a JAPI::Category
    expect(clue.category.title).to eq "alphabetically first"
    expect(clue.category_id).to eq clue.category.category_id
  end
end

