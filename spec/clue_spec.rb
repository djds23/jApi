require 'json'
require 'spec_helper'

describe JAPI::Clue do
  let(:resp) { JSON.parse(clue_resp)[0] }

  it 'can initialize' do
    expect(described_class.new(resp)).not_to be nil
  end

  it 'has a clue id' do
    expect(described_class.new(resp).clue_id).to eq 107165
  end

  it 'returns a category for its category' do
    expect(described_class.new(resp).category).to be_a JAPI::Category
    expect(described_class.new(resp).category.title).to eq "alphabetically first"
  end
end
