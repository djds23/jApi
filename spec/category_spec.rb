require 'json'
require 'spec_helper'

describe JAPI::Category do
  let(:resp) { JSON.parse category_resp}

  it 'can initialize' do
    expect(described_class.new(resp)).not_to be nil
  end

  it 'has a category_id id' do
    expect(described_class.new(resp).category_id).to eq 8056
  end

  it 'has a clue_count' do
    expect(described_class.new(resp).clues_count).to eq 5
  end

  it 'does not ask Trebek for clues if it already has them' do
    allow(JAPI::Trebek).to receive(:category).never
    clues = described_class.new(resp).clues
    expect(clues).to be_a(Array)
    expect(clues.first).to be_a(JAPI::Clue)
    expect(clues.first.clue_id).to eq 62857
  end

  it 'Asks Trebek for clues if there are none' do
    allow(JAPI::Trebek).to receive(:category).once.and_return(double(clues: []))
    resp.delete('clues')
    clues = described_class.new(resp).clues
  end

end

