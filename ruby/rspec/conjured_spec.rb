require_relative 'spec_helper'

describe ConjuredItem do
  let(:expired) { described_class.new("Conjured Mana Cake", -1, 10)}
  let(:not_expired) { described_class.new("Conjured Mana Cake", 2, 10)}

  describe '#update_item' do
    context 'when sell_in not negative' do
      before { not_expired.update_item}

      it 'reduced quality by 2' do
        expect(not_expired.quality).to eq 8
      end
    end

    context 'when sell_in is negative' do
      before { expired.update_item}

      it 'reduced quality by 2' do
        expect(expired.quality).to eq 6
      end
    end
  end
end
