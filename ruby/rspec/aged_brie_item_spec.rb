require_relative 'spec_helper'

describe AgedBrieItem do
  let(:expired) { described_class.new('Aged Brie', -1, 5)}
  let(:not_expired) { described_class.new('Aged Brie', 5, 5)}
  let(:max_quality) { described_class.new('Aged Brie', 5, 50)}

  describe '#update_item' do
    context 'when not expired' do
      it 'increase quality by 1' do
        not_expired.update_item
        expect(not_expired.quality).to eq 6
      end
    end

    context 'when expired' do
      it 'increase quality by 2' do
        expired.update_item
        expect(expired.quality).to eq 7
      end
    end

    context 'when quality is maximum' do
      it 'will not increase quality' do
        max_quality.update_item
        expect(max_quality.quality).to eq 50
      end
    end
  end
end
