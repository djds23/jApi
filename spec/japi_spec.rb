require 'spec_helper'

describe JAPI do
  it 'has a version number' do
    expect(JAPI::VERSION).not_to be nil
  end

  it 'has a Trebek' do
    expect(JAPI::Trebek).not_to be nil
  end
end
