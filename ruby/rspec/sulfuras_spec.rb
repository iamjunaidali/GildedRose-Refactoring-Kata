require_relative 'spec_helper'

describe SulfurasItem do
  let(:expired) { described_class.new('Sulfuras, Hand of Ragnaros', -1, 80)}
  let(:not_expired) { described_class.new('Sulfuras, Hand of Ragnaros', 5, 80)}

  describe 'when expired' do
    it 'will not degrade the quality' do
      expired.update_item
      expect(expired.quality).to eq 80
    end
  end

  describe 'when not expired' do
    it 'will not degrade the quality' do
      not_expired.update_item
      expect(not_expired.quality).to eq 80
    end
  end
end
