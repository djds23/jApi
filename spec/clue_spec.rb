require 'spec_helper'

describe Clue do
  let(:resp) { JSON.parse '{"id":138511,"answer":"a not-for-profit (not-profit accepted)","question":"Hyphenated term for an organization that exists to provide a service rather than to make money","value":400,"airdate":"2011-09-29T12:00:00.000Z","created_at":"2015-01-22T02:25:27.586Z","updated_at":"2015-01-22T02:25:27.586Z","category_id":15674,"game_id":3722,"invalid_count":null,"category":{"id":15674,"title":"\"not\" in front","created_at":"2014-02-14T02:44:36.109Z","updated_at":"2014-02-14T02:44:36.109Z","clues_count":10}}' }
  
  it 'can initialize' do
    expect(Clue.new(resp)).not_to be nil
  end
  
  it 'has a clue id' do
    expect(Clue.new(resp).clue_id).to eq 138511
  end
end
